const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const items = await prisma.saved_heart_item.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Saved Heart Items" });
    }
};

const saved_heart_item = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.saved_heart_item.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "Saved Heart Item not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Saved Heart Item" });
    }
};

const add = async (req, res) => {
    const { lang, heading, add_button_icon, add_button_text, remove_button_icon, remove_button_text } = req.body;

    if (!lang || !heading || !add_button_icon || !add_button_text || !remove_button_icon || !remove_button_text) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newItem = await prisma.saved_heart_item.create({
            data: {
                lang,
                heading,
                add_button_icon,
                add_button_text,
                remove_button_icon,
                remove_button_text
            },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Saved Heart Item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.saved_heart_item.delete({ where: { id } });
        res.status(200).json({ message: "Saved Heart Item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Saved Heart Item not found" });
        }
        res.status(500).json({ message: "Failed to delete Saved Heart Item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.saved_heart_item.update({ where: { id }, data });
        res.status(200).json({ message: "Saved Heart Item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Saved Heart Item not found" });
        }
        res.status(500).json({ message: "Failed to update Saved Heart Item" });
    }
};

module.exports = {
    all,
    saved_heart_item,
    add,
    remove,
    edit,
};
