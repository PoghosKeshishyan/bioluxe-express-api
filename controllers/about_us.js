const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const items = await prisma.about_us.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve About Us data" });
    }
};

const about_us = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.about_us.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "About Us item not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve About Us item" });
    }
};

const add = async (req, res) => {
    const { lang, heading, image } = req.body;

    if (!lang || !heading || !image) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newItem = await prisma.about_us.create({
            data: { lang, heading, image },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add About Us item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.about_us.delete({ where: { id } });
        res.status(200).json({ message: "About Us item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "About Us item not found" });
        }
        res.status(500).json({ message: "Failed to delete About Us item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.about_us.update({ where: { id }, data });
        res.status(200).json({ message: "About Us item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "About Us item not found" });
        }
        res.status(500).json({ message: "Failed to update About Us item" });
    }
};

module.exports = {
    all,
    about_us,
    add,
    remove,
    edit,
};
