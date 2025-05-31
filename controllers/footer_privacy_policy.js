const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const footerPrivacyPolicyItems = await prisma.footer_privacy_policy.findMany(lang && {
            where: {
                lang
            }
        });
        res.status(200).json(footerPrivacyPolicyItems);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Footer Privacy Policy data" });
    }
};

const footer_privacy_policy = async (req, res) => {
    const { id } = req.params;
    try {
        const footerPrivacyPolicyItem = await prisma.footer_privacy_policy.findUnique({ where: { id } });
        if (!footerPrivacyPolicyItem) {
            return res.status(404).json({ message: "Footer Privacy Policy item not found" });
        }
        res.status(200).json(footerPrivacyPolicyItem);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Footer Privacy Policy data" });
    }
};

const add = async (req, res) => {
    const { lang, title, url } = req.body;
    if (!lang || !title || !url) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const footerPrivacyPolicyItem = await prisma.footer_privacy_policy.create({
            data: { lang, title, url },
        });
        res.status(201).json(footerPrivacyPolicyItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Footer Privacy Policy item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.footer_privacy_policy.delete({ where: { id } });
        res.status(200).json({ message: "Footer Privacy Policy item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Footer Privacy Policy item not found" });
        }
        res.status(500).json({ message: "Failed to delete Footer Privacy Policy item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        await prisma.footer_privacy_policy.update({ where: { id }, data });
        res.status(200).json({ message: "Footer Privacy Policy item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Footer Privacy Policy item not found" });
        }
        res.status(500).json({ message: "Failed to update Footer Privacy Policy item" });
    }
};

module.exports = {
    all,
    footer_privacy_policy,
    add,
    remove,
    edit,
};
