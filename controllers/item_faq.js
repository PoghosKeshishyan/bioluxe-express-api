const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const faqs = await prisma.item_faq.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(faqs);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Item FAQ data" });
    }
};

const item_faq = async (req, res) => {
    const { id } = req.params;
    try {
        const faq = await prisma.item_faq.findUnique({
            where: { id },
        });
        if (!faq) {
            return res.status(404).json({ message: "Item FAQ not found" });
        }
        res.status(200).json(faq);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve Item FAQ data" });
    }
};

const add = async (req, res) => {
    const { lang, question, answer } = req.body;
    if (!lang || !question || !answer) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        const newFaq = await prisma.item_faq.create({
            data: { lang, question, answer },
        });
        res.status(201).json(newFaq);
    } catch (error) {
        console.error("Error creating Item FAQ:", error);
        res.status(500).json({ message: "Failed to add Item FAQ", error: error.message });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.item_faq.delete({ where: { id } });
        res.status(200).json({ message: "Item FAQ deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item FAQ not found" });
        }
        res.status(500).json({ message: "Failed to delete Item FAQ" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        await prisma.item_faq.update({
            where: { id },
            data,
        });
        res.status(200).json({ message: "Item FAQ updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item FAQ not found" });
        }
        res.status(500).json({ message: "Failed to update Item FAQ" });
    }
};

module.exports = {
    all,
    item_faq,
    add,
    remove,
    edit,
};
