const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const homepageCategoriesHeadings = await prisma.homepage_categories_heading.findMany(lang && {
            where: {
                lang
        }
        });
        res.status(200).json(homepageCategoriesHeadings);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Homepage Categories Heading data" });
    }
};

const homepage_categories_heading = async (req, res) => {
    const { id } = req.params;
    try {
        const homepageCategoriesHeading = await prisma.homepage_categories_heading.findUnique({ where: { id } });
        if (!homepageCategoriesHeading) {
            return res.status(404).json({ message: "Homepage Categories Heading item not found" });
        }
        res.status(200).json(homepageCategoriesHeading);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Homepage Categories Heading data" });
    }
};

const add = async (req, res) => {
    const { lang, title } = req.body;
    if (!lang || !title) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const homepageCategoriesHeading = await prisma.homepage_categories_heading.create({
            data: { lang, title },
        });
        res.status(201).json(homepageCategoriesHeading);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Homepage Categories Heading item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.homepage_categories_heading.delete({ where: { id } });
        res.status(200).json({ message: "Homepage Categories Heading item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Categories Heading item not found" });
        }
        res.status(500).json({ message: "Failed to delete Homepage Categories Heading item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        await prisma.homepage_categories_heading.update({ where: { id }, data });
        res.status(200).json({ message: "Homepage Categories Heading item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Categories Heading item not found" });
        }
        res.status(500).json({ message: "Failed to update Homepage Categories Heading item" });
    }
};

module.exports = {
    all,
    homepage_categories_heading,
    add,
    remove,
    edit,
};
