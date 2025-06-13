const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const homepagePartnersHeadings = await prisma.homepage_partners_heading.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(homepagePartnersHeadings);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage Partners Heading data" });
    }
};

const homepage_partners_heading = async (req, res) => {
    const { id } = req.params;
    try {
        const heading = await prisma.homepage_partners_heading.findUnique({
            where: { id },
        });
        if (!heading) {
            return res.status(404).json({ message: "Homepage Partners Heading item not found" });
        }
        res.status(200).json(heading);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage Partners Heading data" });
    }
};

const add = async (req, res) => {
    const { lang, heading } = req.body;
    if (!lang || !heading) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const newHeading = await prisma.homepage_partners_heading.create({
            data: { lang, heading },
        });
        res.status(201).json(newHeading);
    } catch (error) {
        console.error("Error creating Homepage Partners Heading:", error);
        res.status(500).json({ message: "Failed to add Homepage Partners Heading item", error: error.message });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.homepage_partners_heading.delete({ where: { id } });
        res.status(200).json({ message: "Homepage Partners Heading item deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Partners Heading item not found" });
        }
        res.status(500).json({ message: "Failed to delete Homepage Partners Heading item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        await prisma.homepage_partners_heading.update({
            where: { id },
            data,
        });
        res.status(200).json({ message: "Homepage Partners Heading item updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Partners Heading item not found" });
        }
        res.status(500).json({ message: "Failed to update Homepage Partners Heading item" });
    }
};

module.exports = {
    all,
    homepage_partners_heading,
    add,
    remove,
    edit,
};
