const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const items = await prisma.categories_link.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve category links" });
    }
};

const categories_link = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.categories_link.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "Category link not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve category link" });
    }
};

const add = async (req, res) => {
    const {
        lang, main, catalog, filter_by, category,
        materials, price, sort_by, from, to
    } = req.body;

    if (
        !lang || !main || !catalog || !filter_by || !category ||
        !materials || !price || !sort_by || !from || !to
    ) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newItem = await prisma.categories_link.create({
            data: {
                lang,
                main,
                catalog,
                filter_by,
                category,
                materials,
                price,
                sort_by,
                from,
                to,
            },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add category link" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.categories_link.delete({ where: { id } });
        res.status(200).json({ message: "Category link deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Category link not found" });
        }
        res.status(500).json({ message: "Failed to delete category link" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.categories_link.update({ where: { id }, data });
        res.status(200).json({ message: "Category link updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Category link not found" });
        }
        res.status(500).json({ message: "Failed to update category link" });
    }
};

module.exports = {
    all,
    categories_link,
    add,
    remove,
    edit,
};
