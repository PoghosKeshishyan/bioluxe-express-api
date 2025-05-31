const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang;

    try {
        const navbars = await prisma.navbar.findMany({
            where: lang ? { lang } : undefined,
            include: { submenu: true } 
        });
        res.status(200).json(navbars);
    } catch {
        res.status(400).json({ message: "Failed to retrieve navbar data" });
    }
};

const navbar = async (req, res) => {
    const { id } = req.params;

    try {
        const navItem = await prisma.navbar.findUnique({
            where: { id },
            include: { submenu: true } 
        });

        if (!navItem) {
            return res.status(404).json({ message: "Navbar item not found" });
        }

        res.status(200).json(navItem);
    } catch {
        res.status(400).json({ message: "Failed to retrieve navbar data" });
    }
};


const add = async (req, res) => {
    const { lang, title, route, submenu } = req.body;

    if (!lang || !title || !route) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const navItem = await prisma.navbar.create({
            data: {
                lang,
                title,
                route,
                submenu: submenu?.length
                    ? {
                          create: submenu
                      }
                    : undefined
            },
            include: {
                submenu: true
            }
        });

        res.status(201).json(navItem);
    } catch (error) {
        console.error("Error adding navbar:", error);
        res.status(500).json({ message: "Failed to add navbar item" });
    }
};


const remove = async (req, res) => {
    const { id } = req.params;

    try {
        await prisma.navbar.delete({ where: { id } });
        res.status(200).json({ message: "Navbar item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Navbar item not found" });
        }
        res.status(500).json({ message: "Failed to delete navbar item" });
    }
};


const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.navbar.update({ where: { id }, data });
        res.status(200).json({ message: "Navbar item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Navbar item not found" });
        }
        res.status(500).json({ message: "Failed to update navbar item" });
    }
};

module.exports = {
    all,
    navbar,
    add,
    remove,
    edit,
};
