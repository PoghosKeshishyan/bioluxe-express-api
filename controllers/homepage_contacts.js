const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';  
    try {
        const homepageContacts = await prisma.homepage_contact.findMany(
            lang ? { where: { lang } } : {} 
        );
        res.status(200).json(homepageContacts);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage Contact data" });
    }
};

const homepage_contact = async (req, res) => {
    const { id } = req.params;  
    try {
        const homepageContact = await prisma.homepage_contact.findUnique({
            where: { id },
        });
        if (!homepageContact) {
            return res.status(404).json({ message: "Homepage Contact item not found" });
        }
        res.status(200).json(homepageContact);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Homepage Contact data" });
    }
};

const add = async (req, res) => {
    const { lang, heading, map_image, map_url } = req.body;  
    if (!lang || !heading || !map_image || !map_url) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const homepageContact = await prisma.homepage_contact.create({
            data: { lang, heading, map_image, map_url },  
        });
        res.status(201).json(homepageContact);  
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to add Homepage Contact item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;  
    try {
        await prisma.homepage_contact.delete({ where: { id } });  
        res.status(200).json({ message: "Homepage Contact item deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Contact item not found" });
        }
        res.status(500).json({ message: "Failed to delete Homepage Contact item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;  
    const data = req.body;  
    try {
        await prisma.homepage_contact.update({
            where: { id },
            data,  
        });
        res.status(200).json({ message: "Homepage Contact item updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Homepage Contact item not found" });
        }
        res.status(500).json({ message: "Failed to update Homepage Contact item" });
    }
};

module.exports = {
    all,
    homepage_contact,
    add,
    remove,
    edit,
};
