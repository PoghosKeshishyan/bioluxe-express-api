const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const items = await prisma.basket_heart_view_link.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Basket Heart View Links" });
    }
};

const basket_heart_view_link = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.basket_heart_view_link.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "Basket Heart View Link not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Basket Heart View Link" });
    }
};

const add = async (req, res) => {
    const { lang, text, url } = req.body;

    if (!lang || !text || !url) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newItem = await prisma.basket_heart_view_link.create({
            data: {
                lang,
                text,
                url
            },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Basket Heart View Link" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.basket_heart_view_link.delete({ where: { id } });
        res.status(200).json({ message: "Basket Heart View Link deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Basket Heart View Link not found" });
        }
        res.status(500).json({ message: "Failed to delete Basket Heart View Link" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.basket_heart_view_link.update({ where: { id }, data });
        res.status(200).json({ message: "Basket Heart View Link updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Basket Heart View Link not found" });
        }
        res.status(500).json({ message: "Failed to update Basket Heart View Link" });
    }
};

module.exports = {
    all,
    basket_heart_view_link,
    add,
    remove,
    edit,
};
