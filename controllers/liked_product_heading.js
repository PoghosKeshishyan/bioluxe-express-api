const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const items = await prisma.liked_product_heading.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Liked Product Headings" });
    }
};

const liked_product_headings = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.liked_product_heading.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "Liked Product Heading not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Liked Product Heading" });
    }
};

const add = async (req, res) => {
    const { lang, title } = req.body;

    if (!lang || !title) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newItem = await prisma.liked_product_heading.create({
            data: { lang, title },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Liked Product Heading" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.liked_product_heading.delete({ where: { id } });
        res.status(200).json({ message: "Liked Product Heading deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Liked Product Heading not found" });
        }
        res.status(500).json({ message: "Failed to delete Liked Product Heading" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.liked_product_heading.update({ where: { id }, data });
        res.status(200).json({ message: "Liked Product Heading updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Liked Product Heading not found" });
        }
        res.status(500).json({ message: "Failed to update Liked Product Heading" });
    }
};

module.exports = {
    all,
    liked_product_headings,
    add,
    remove,
    edit,
};
