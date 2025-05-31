const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    try {
        const languages = await prisma.language.findMany();
        res.status(200).json(languages);
    } catch {
        res.status(400).json({ message: "Failed to retrieve languages data" });
    }
};

const language = async (req, res) => {
    const { id } = req.params;

    try {
        const languageItem = await prisma.language.findUnique({ where: { id } });

        if (!languageItem) {
            return res.status(404).json({ message: "Language item not found" });
        }

        res.status(200).json(languageItem);
    } catch {
        res.status(400).json({ message: "Failed to retrieve language data" });
    }
};

const add = async (req, res) => {
    const data = req.body;

    if (!data.label || !data.image) {
        return res.status(400).json({ message: "Label and image fields are required" });
    }

    try {
        const languageItem = await prisma.language.create({
            data,
        });

        res.status(201).json(languageItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add language item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;

    try {
        await prisma.language.delete({ where: { id } });
        res.status(200).json({ message: "Language item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Language item not found" });
        }

        res.status(500).json({ message: "Failed to delete language item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.language.update({ where: { id }, data });
        res.status(200).json({ message: "Language item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Language item not found" });
        }

        res.status(500).json({ message: "Failed to update language item" });
    }
};

module.exports = {
    all,
    language,
    add,
    remove,
    edit,
};
