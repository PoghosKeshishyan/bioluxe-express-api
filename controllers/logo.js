const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    try {
        const logos = await prisma.logo.findMany();
        res.status(200).json(logos);
    } catch {
        res.status(400).json({ message: "Failed to retrieve logo data" });
    }
};

const logo = async (req, res) => {
    const { id } = req.params;

    try {
        const logoItem = await prisma.logo.findUnique({ where: { id } });

        if (!logoItem) {
            return res.status(404).json({ message: "Logo item not found" });
        }

        res.status(200).json(logoItem);
    } catch {
        res.status(400).json({ message: "Failed to retrieve logo data" });
    }
};

const add = async (req, res) => {
    const data = req.body;

    if (!data.image) {
        return res.status(400).json({ message: "Image field is required" });
    }

    try {
        const logoItem = await prisma.logo.create({
            data,
        });

        res.status(201).json(logoItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add logo item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;

    try {
        await prisma.logo.delete({ where: { id } });
        res.status(200).json({ message: "Logo item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Logo item not found" });
        }

        res.status(500).json({ message: "Failed to delete logo item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.logo.update({ where: { id }, data });
        res.status(200).json({ message: "Logo item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Logo item not found" });
        }

        res.status(500).json({ message: "Failed to update logo item" });
    }
};

module.exports = {
    all,
    logo,
    add,
    remove,
    edit,
};
