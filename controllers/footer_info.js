const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const footerInfoItems = await prisma.footer_info.findMany(lang && {
            where: {
                lang
            }
        });
        res.status(200).json(footerInfoItems);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Footer Info data" });
    }
};

const footer_info = async (req, res) => {
    const { id } = req.params;
    try {
        const footerInfoItem = await prisma.footer_info.findUnique({ where: { id } });
        if (!footerInfoItem) {
            return res.status(404).json({ message: "Footer Info item not found" });
        }
        res.status(200).json(footerInfoItem);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Footer Info data" });
    }
};

const add = async (req, res) => {
    const { lang, address, phone, email, address_icon, phone_icon, email_icon } = req.body;
    if (!lang || !address || !phone || !email || !address_icon || !phone_icon || !email_icon) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const footerInfoItem = await prisma.footer_info.create({
            data: { lang, address, phone, email, address_icon, phone_icon, email_icon },
        });
        res.status(201).json(footerInfoItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Footer Info item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.footer_info.delete({ where: { id } });
        res.status(200).json({ message: "Footer Info item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Footer Info item not found" });
        }
        res.status(500).json({ message: "Failed to delete Footer Info item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        await prisma.footer_info.update({ where: { id }, data });
        res.status(200).json({ message: "Footer Info item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Footer Info item not found" });
        }
        res.status(500).json({ message: "Failed to update Footer Info item" });
    }
};

module.exports = {
    all,
    footer_info,
    add,
    remove,
    edit,
};
