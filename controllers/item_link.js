const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const items = await prisma.item_link.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Item Links" });
    }
};

const item_links = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.item_link.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "Item Link not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Item Link" });
    }
};

const add = async (req, res) => {
    const { lang, item, catalog, cribs } = req.body;

    if (!lang || !item || !catalog || !cribs) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newItem = await prisma.item_link.create({
            data: { lang, item, catalog, cribs },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Item Link" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.item_link.delete({ where: { id } });
        res.status(200).json({ message: "Item Link deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item Link not found" });
        }
        res.status(500).json({ message: "Failed to delete Item Link" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.item_link.update({ where: { id }, data });
        res.status(200).json({ message: "Item Link updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item Link not found" });
        }
        res.status(500).json({ message: "Failed to update Item Link" });
    }
};

module.exports = {
    all,
    item_links,
    add,
    remove,
    edit,
};
