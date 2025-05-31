const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const contactInfos = await prisma.contact_info.findMany(lang && {
            where: { lang }
        });
        res.status(200).json(contactInfos);
    } catch {
        res.status(400).json({ message: "Failed to retrieve contact info list" });
    }
};

const contact_info = async (req, res) => {
    const { id } = req.params;
    try {
        const contactInfo = await prisma.contact_info.findUnique({ where: { id } });
        if (!contactInfo) {
            return res.status(404).json({ message: "Contact info not found" });
        }
        res.status(200).json(contactInfo);
    } catch {
        res.status(400).json({ message: "Failed to retrieve contact info" });
    }
};

const add = async (req, res) => {
    const {
        lang,
        map_image,
        address,
        phone,
        email,
        address_icon,
        phone_icon,
        email_icon
    } = req.body;

    if (
        !lang || !map_image || !address || !phone || !email ||
        !address_icon || !phone_icon || !email_icon
    ) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const contactInfo = await prisma.contact_info.create({
            data: {
                lang,
                map_image,
                address,
                phone,
                email,
                address_icon,
                phone_icon,
                email_icon
            }
        });
        res.status(201).json(contactInfo);
    } catch (error) {
        console.log(error);
        
        res.status(500).json({ message: "Failed to add contact info" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.contact_info.delete({ where: { id } });
        res.status(200).json({ message: "Contact info deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Contact info not found" });
        }
        res.status(500).json({ message: "Failed to delete contact info" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.contact_info.update({ where: { id }, data });
        res.status(200).json({ message: "Contact info updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Contact info not found" });
        }
        res.status(500).json({ message: "Failed to update contact info" });
    }
};

module.exports = {
    all,
    contact_info,
    add,
    remove,
    edit,
};
