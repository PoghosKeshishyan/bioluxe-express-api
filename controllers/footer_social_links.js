const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    try {
        const footerSocialLinks = await prisma.footer_social_links.findMany();
        res.status(200).json(footerSocialLinks);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Footer Social Links data" });
    }
};

const footer_social_link = async (req, res) => {
    const { id } = req.params;
    try {
        const footerSocialLink = await prisma.footer_social_links.findUnique({ where: { id } });
        if (!footerSocialLink) {
            return res.status(404).json({ message: "Footer Social Link not found" });
        }
        res.status(200).json(footerSocialLink);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Footer Social Link data" });
    }
};

const add = async (req, res) => {
    const { icon, url } = req.body;
    if (!icon || !url) {
        return res.status(400).json({ message: "Both icon and URL are required" });
    }
    try {
        const footerSocialLink = await prisma.footer_social_links.create({
            data: { icon, url },
        });
        res.status(201).json(footerSocialLink);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Footer Social Link" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.footer_social_links.delete({ where: { id } });
        res.status(200).json({ message: "Footer Social Link deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Footer Social Link not found" });
        }
        res.status(500).json({ message: "Failed to delete Footer Social Link" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        const footerSocialLink = await prisma.footer_social_links.update({ where: { id }, data });
        res.status(200).json({ message: "Footer Social Link updated successfully", footerSocialLink });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Footer Social Link not found" });
        }
        res.status(500).json({ message: "Failed to update Footer Social Link" });
    }
};

module.exports = {
    all,
    footer_social_link,
    add,
    remove,
    edit,
};
