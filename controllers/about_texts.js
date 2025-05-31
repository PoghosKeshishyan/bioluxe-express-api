const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const items = await prisma.about_text.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve About Text data" });
    }
};

const about_texts = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.about_text.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "About Text item not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve About Text item" });
    }
};

const add = async (req, res) => {
    const { lang, heading, content1, content2, image } = req.body;

    if (!lang || !heading || !content1 || !content2 || !image) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newItem = await prisma.about_text.create({
            data: { lang, heading, content1, content2, image },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add About Text item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.about_text.delete({ where: { id } });
        res.status(200).json({ message: "About Text item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "About Text item not found" });
        }
        res.status(500).json({ message: "Failed to delete About Text item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.about_text.update({ where: { id }, data });
        res.status(200).json({ message: "About Text item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "About Text item not found" });
        }
        res.status(500).json({ message: "Failed to update About Text item" });
    }
};

module.exports = {
    all,
    about_texts,
    add,
    remove,
    edit,
};
