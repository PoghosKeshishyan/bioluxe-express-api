const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const items = await prisma.info_about_delivery.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve delivery info" });
    }
};

const info_about_delivery = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.info_about_delivery.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "Delivery info not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve delivery info" });
    }
};

const add = async (req, res) => {
    const { lang, title, texts } = req.body;

    if (!lang || !title || !texts) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newItem = await prisma.info_about_delivery.create({
            data: { lang, title, texts },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add delivery info" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.info_about_delivery.delete({ where: { id } });
        res.status(200).json({ message: "Delivery info deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Delivery info not found" });
        }
        res.status(500).json({ message: "Failed to delete delivery info" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.info_about_delivery.update({ where: { id }, data });
        res.status(200).json({ message: "Delivery info updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Delivery info not found" });
        }
        res.status(500).json({ message: "Failed to update delivery info" });
    }
};

module.exports = {
    all,
    info_about_delivery,
    add,
    remove,
    edit,
};
