const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    const category_name = req.query.category_name || '';

    try {
        const items = await prisma.items_header.findMany(lang && {
            where: { lang, category_name }
        });
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve items header data" });
    }
};

const items_header = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.items_header.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "Item not found" });
        }
        res.status(200).json({ items_header: item });
    } catch {
        res.status(400).json({ message: "Failed to retrieve item" });
    }
};

const add = async (req, res) => {
    const { lang, image, category_name, title, descr } = req.body;

    if (!lang || !image || !category_name || !title || !descr) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const item = await prisma.items_header.create({
            data: {
                lang,
                image,
                category_name,
                title,
                descr,
            },
        });
        res.status(201).json(item);
    } catch (error) {
        res.status(500).json({ message: "Failed to add item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.items_header.update({
            where: { id },
            data,
        });
        res.status(200).json({ message: "Item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item not found" });
        }
        res.status(500).json({ message: "Failed to update item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;

    try {
        await prisma.items_header.delete({
            where: { id },
        });
        res.status(200).json({ message: "Item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item not found" });
        }
        res.status(500).json({ message: "Failed to delete item" });
    }
};

module.exports = {
    all,
    items_header,
    add,
    edit,
    remove,
};
