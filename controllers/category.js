const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const categories = await prisma.category.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(categories);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Category data" });
    }
};

const category = async (req, res) => {
    const { id } = req.params;
    try {
        const category = await prisma.category.findUnique({ where: { id } });
        if (!category) {
            return res.status(404).json({ message: "Category not found" });
        }
        res.status(200).json(category);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Category data" });
    }
};

const add = async (req, res) => {
    const { lang, title, descr, image } = req.body;
    if (!lang || !title || !descr || !image) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const category = await prisma.category.create({
            data: { lang, title, descr, image },
        });
        res.status(201).json(category);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to add Category" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.category.delete({ where: { id } });
        res.status(200).json({ message: "Category deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Category not found" });
        }
        res.status(500).json({ message: "Failed to delete Category" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        await prisma.category.update({ where: { id }, data });
        res.status(200).json({ message: "Category updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Category not found" });
        }
        res.status(500).json({ message: "Failed to update Category" });
    }
};

module.exports = {
    all,
    category,
    add,
    remove,
    edit,
};
