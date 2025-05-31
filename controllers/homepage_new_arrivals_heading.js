const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';  
    try {
        const homepageNewArrivalsHeadings = await prisma.homepage_new_arrivals_heading.findMany(
            lang ? { where: { lang } } : {} 
        );
        res.status(200).json(homepageNewArrivalsHeadings);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage New Arrivals Heading data" });
    }
};

const homepage_new_arrivals_heading = async (req, res) => {
    const { id } = req.params;  
    try {
        const homepageNewArrivalsHeading = await prisma.homepage_new_arrivals_heading.findUnique({
            where: { id },
        });
        if (!homepageNewArrivalsHeading) {
            return res.status(404).json({ message: "Homepage New Arrivals Heading item not found" });
        }
        res.status(200).json(homepageNewArrivalsHeading);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage New Arrivals Heading data" });
    }
};


const add = async (req, res) => {
    const { lang, title } = req.body;  
    if (!lang || !title) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const homepageNewArrivalsHeading = await prisma.homepage_new_arrivals_heading.create({
            data: { lang, title },  
        });
        res.status(201).json(homepageNewArrivalsHeading);  
    } catch (error) {
        console.error("Error creating Homepage New Arrivals Heading:", error);  
        res.status(500).json({ message: "Failed to add Homepage New Arrivals Heading item", error: error.message });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;  
    try {
        await prisma.homepage_new_arrivals_heading.delete({ where: { id } });  
        res.status(200).json({ message: "Homepage New Arrivals Heading item deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage New Arrivals Heading item not found" });
        }
        res.status(500).json({ message: "Failed to delete Homepage New Arrivals Heading item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;  
    const data = req.body;  
    try {
        await prisma.homepage_new_arrivals_heading.update({
            where: { id },
            data,  
        });
        res.status(200).json({ message: "Homepage New Arrivals Heading item updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage New Arrivals Heading item not found" });
        }
        res.status(500).json({ message: "Failed to update Homepage New Arrivals Heading item" });
    }
};

module.exports = {
    all,
    homepage_new_arrivals_heading,
    add,
    remove,
    edit,
};
