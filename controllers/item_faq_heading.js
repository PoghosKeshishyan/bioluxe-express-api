const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const headings = await prisma.item_faq_heading.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(headings);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Item FAQ Heading data" });
    }
};

const item_faq_heading = async (req, res) => {
    const { id } = req.params;
    try {
        const heading = await prisma.item_faq_heading.findUnique({
            where: { id },
        });
        if (!heading) {
            return res.status(404).json({ message: "Item FAQ Heading not found" });
        }
        res.status(200).json(heading);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Item FAQ Heading data" });
    }
};

const add = async (req, res) => {
    const { lang, heading } = req.body;
    if (!lang || !heading) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const newHeading = await prisma.item_faq_heading.create({
            data: { lang, heading },
        });
        res.status(201).json(newHeading);
    } catch (error) {
        console.error("Error creating Item FAQ Heading:", error);
        res.status(500).json({ message: "Failed to add Item FAQ Heading", error: error.message });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.item_faq_heading.delete({ where: { id } });
        res.status(200).json({ message: "Item FAQ Heading deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item FAQ Heading not found" });
        }
        res.status(500).json({ message: "Failed to delete Item FAQ Heading" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        await prisma.item_faq_heading.update({
            where: { id },
            data,
        });
        res.status(200).json({ message: "Item FAQ Heading updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item FAQ Heading not found" });
        }
        res.status(500).json({ message: "Failed to update Item FAQ Heading" });
    }
};

module.exports = {
    all,
    item_faq_heading,
    add,
    remove,
    edit,
};
