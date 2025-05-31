const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    try {
        const header_icon = await prisma.header_icon.findMany();
        res.status(200).json(header_icon);
    } catch {
        res.status(400).json({ message: "Failed to retrieve header icons" });
    }
};

const header_icon = async (req, res) => {
    const { id } = req.params;

    try {
        const header_icon = await prisma.header_icon.findUnique({ where: { id } });

        if (!header_icon) {
            return res.status(404).json({ message: "Header icon not found" });
        }

        res.status(200).json(header_icon);
    } catch {
        res.status(400).json({ message: "Failed to retrieve header icon data" });
    }
};

const add = async (req, res) => {
    const data = req.body;

    if (
        !data.search_icon ||
        !data.heart_icon ||
        !data.cart_icon ||
        !data.language_arrow_icon
    ) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const header_icon = await prisma.header_icon.create({
            data,
        });

        res.status(201).json(header_icon);
    } catch (error) {
        res.status(500).json({ message: "Failed to add header icon" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;

    try {
        await prisma.header_icon.delete({ where: { id } });
        res.status(200).json({ message: "Header icon deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: 'Header icon not found' });
        }

        res.status(500).json({ message: "Failed to delete header icon" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.header_icon.update({ where: { id }, data });
        res.status(200).json({ message: "Header icon updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: 'Header icon not found' });
        }

        res.status(500).json({ message: "Failed to update header icon" });
    }
};

module.exports = {
    all,
    header_icon,
    add,
    remove,
    edit,
};
