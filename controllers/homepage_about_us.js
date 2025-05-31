const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const homepageAboutUs = await prisma.homepage_about_us.findMany(lang && {
            where: {
                lang
            }
        });
        res.status(200).json(homepageAboutUs);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage About Us data" });
    }
};

const homepage_about_us = async (req, res) => {
    const { id } = req.params;
    try {
        const homepageAboutUsItem = await prisma.homepage_about_us.findUnique({ where: { id } });
        if (!homepageAboutUsItem) {
            return res.status(404).json({ message: "Homepage About Us item not found" });
        }
        res.status(200).json(homepageAboutUsItem);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage About Us data" });
    }
};

const add = async (req, res) => {
    const { lang, heading, descr, btn_text, btn_url, image_1, image_2 } = req.body;
    if (!lang || !heading || !descr || !btn_text || !btn_url || !image_1 || !image_2) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const homepageAboutUsItem = await prisma.homepage_about_us.create({
            data: { lang, heading, descr, btn_text, btn_url, image_1, image_2 },
        });
        res.status(201).json(homepageAboutUsItem);
    } catch (error) {
        console.error("Error creating Homepage About Us item:", error);  // Log the error in more detail
        res.status(500).json({ message: "Failed to add Homepage About Us item", error: error.message });
    }
};


const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.homepage_about_us.delete({ where: { id } });
        res.status(200).json({ message: "Homepage About Us item deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage About Us item not found" });
        }
        res.status(500).json({ message: "Failed to delete Homepage About Us item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        await prisma.homepage_about_us.update({ where: { id }, data });
        res.status(200).json({ message: "Homepage About Us item updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage About Us item not found" });
        }
        res.status(500).json({ message: "Failed to update Homepage About Us item" });
    }
};

module.exports = {
    all,
    homepage_about_us,
    add,
    remove,
    edit,
};
