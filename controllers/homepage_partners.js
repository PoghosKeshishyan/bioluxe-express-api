const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    try {
        const partners = await prisma.homepage_partner.findMany();
        res.status(200).json(partners);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage Partner data" });
    }
};

const homepage_partner = async (req, res) => {
    const { id } = req.params;
    try {
        const partner = await prisma.homepage_partner.findUnique({
            where: { id },
        });
        if (!partner) {
            return res.status(404).json({ message: "Homepage Partner not found" });
        }
        res.status(200).json(partner);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage Partner data" });
    }
};

const add = async (req, res) => {
    const { image } = req.body;
    if (!image) {
        return res.status(400).json({ message: "Image is required" });
    }
    try {
        const partner = await prisma.homepage_partner.create({
            data: { image },
        });
        res.status(201).json(partner);
    } catch (error) {
        console.error("Error creating Homepage Partner:", error);
        res.status(500).json({ message: "Failed to add Homepage Partner", error: error.message });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.homepage_partner.delete({ where: { id } });
        res.status(200).json({ message: "Homepage Partner deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Partner not found" });
        }
        res.status(500).json({ message: "Failed to delete Homepage Partner" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        await prisma.homepage_partner.update({
            where: { id },
            data,
        });
        res.status(200).json({ message: "Homepage Partner updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Partner not found" });
        }
        res.status(500).json({ message: "Failed to update Homepage Partner" });
    }
};

module.exports = {
    all,
    homepage_partner,
    add,
    remove,
    edit,
};
