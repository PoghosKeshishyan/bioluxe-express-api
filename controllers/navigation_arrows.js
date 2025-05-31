const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    try {
        const items = await prisma.navigation_arrow.findMany();
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Navigation Arrows" });
    }
};

const navigation_arrow = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.navigation_arrow.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "Navigation Arrow not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Navigation Arrow" });
    }
};

const add = async (req, res) => {
    const { type, image } = req.body;

    if (!type || !image) {
        return res.status(400).json({ message: "Type and Image are required" });
    }

    try {
        const newItem = await prisma.navigation_arrow.create({
            data: { type, image },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Navigation Arrow" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.navigation_arrow.delete({ where: { id } });
        res.status(200).json({ message: "Navigation Arrow deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Navigation Arrow not found" });
        }
        res.status(500).json({ message: "Failed to delete Navigation Arrow" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.navigation_arrow.update({ where: { id }, data });
        res.status(200).json({ message: "Navigation Arrow updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Navigation Arrow not found" });
        }
        res.status(500).json({ message: "Failed to update Navigation Arrow" });
    }
};

module.exports = {
    all,
    navigation_arrow,
    add,
    remove,
    edit,
};
