const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const contactTitles = await prisma.contact_title.findMany(lang && {
            where: { lang }
        });
        res.status(200).json(contactTitles);
    } catch {
        res.status(400).json({ message: "Failed to retrieve contact titles" });
    }
};

const contact_title = async (req, res) => {
    const { id } = req.params;
    try {
        const contactTitle = await prisma.contact_title.findUnique({
            where: { id }
        });
        if (!contactTitle) {
            return res.status(404).json({ message: "Contact title not found" });
        }
        res.status(200).json(contactTitle);
    } catch {
        res.status(400).json({ message: "Failed to retrieve contact title" });
    }
};

const add = async (req, res) => {
    const { lang, title, image_url } = req.body;

    if (!lang || !title || !image_url) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const contactTitle = await prisma.contact_title.create({
            data: { lang, title, image_url }
        });
        res.status(201).json(contactTitle);
    } catch (error) {
        res.status(500).json({ message: "Failed to add contact title" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.contact_title.delete({ where: { id } });
        res.status(200).json({ message: "Contact title deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Contact title not found" });
        }
        res.status(500).json({ message: "Failed to delete contact title" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.contact_title.update({
            where: { id },
            data
        });
        res.status(200).json({ message: "Contact title updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Contact title not found" });
        }
        res.status(500).json({ message: "Failed to update contact title" });
    }
};

module.exports = {
    all,
    contact_title,
    add,
    remove,
    edit,
};
