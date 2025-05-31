const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';  
    try {
        const homepagePopularItemHeadings = await prisma.homepage_popular_item_heading.findMany(
            lang ? { where: { lang } } : {} 
        );
        res.status(200).json(homepagePopularItemHeadings);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage Popular Item Heading data" });
    }
};

const homepage_popular_item_heading = async (req, res) => {
    const { id } = req.params; 
    try {
        const homepagePopularItemHeading = await prisma.homepage_popular_item_heading.findUnique({
            where: { id },
        });
        if (!homepagePopularItemHeading) {
            return res.status(404).json({ message: "Homepage Popular Item Heading item not found" });
        }
        res.status(200).json(homepagePopularItemHeading);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage Popular Item Heading data" });
    }
};

const add = async (req, res) => {
    const { lang, title } = req.body;  
    if (!lang || !title) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const homepagePopularItemHeading = await prisma.homepage_popular_item_heading.create({
            data: { lang, title },  
        });
        res.status(201).json(homepagePopularItemHeading);  
    } catch (error) {
        console.error("Error creating Homepage Popular Item Heading:", error);  
        res.status(500).json({ message: "Failed to add Homepage Popular Item Heading item", error: error.message });
    }
};


const remove = async (req, res) => {
    const { id } = req.params;  
    try {
        await prisma.homepage_popular_item_heading.delete({ where: { id } });  
        res.status(200).json({ message: "Homepage Popular Item Heading item deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Popular Item Heading item not found" });
        }
        res.status(500).json({ message: "Failed to delete Homepage Popular Item Heading item" });
    }
};


const edit = async (req, res) => {
    const { id } = req.params; 
    const data = req.body;  
    try {
        await prisma.homepage_popular_item_heading.update({
            where: { id },
            data,  
        });
        res.status(200).json({ message: "Homepage Popular Item Heading item updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Popular Item Heading item not found" });
        }
        res.status(500).json({ message: "Failed to update Homepage Popular Item Heading item" });
    }
};

module.exports = {
    all,
    homepage_popular_item_heading,
    add,
    remove,
    edit,
};
