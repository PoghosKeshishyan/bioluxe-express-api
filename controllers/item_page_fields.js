const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const items = await prisma.item_page_field.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(items);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Item Page Fields" });
    }
};

const item_page_fields = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await prisma.item_page_field.findUnique({ where: { id } });
        if (!item) {
            return res.status(404).json({ message: "Item Page Field not found" });
        }
        res.status(200).json(item);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Item Page Field" });
    }
};

const add = async (req, res) => {
    const {
        lang,
        size_text_field,
        size_text_field_2,
        descr_text_field,
        product_number_text_field,
        material_text_field,
        about_delivery_text_field,
        not_available_text_field
    } = req.body;

    if (
        !lang || !size_text_field || !size_text_field_2 || !descr_text_field ||
        !product_number_text_field || !material_text_field ||
        !about_delivery_text_field || !not_available_text_field
    ) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newItem = await prisma.item_page_field.create({
            data: {
                lang,
                size_text_field,
                size_text_field_2,
                descr_text_field,
                product_number_text_field,
                material_text_field,
                about_delivery_text_field,
                not_available_text_field
            },
        });
        res.status(201).json(newItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Item Page Field" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.item_page_field.delete({ where: { id } });
        res.status(200).json({ message: "Item Page Field deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item Page Field not found" });
        }
        res.status(500).json({ message: "Failed to delete Item Page Field" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.item_page_field.update({ where: { id }, data });
        res.status(200).json({ message: "Item Page Field updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item Page Field not found" });
        }
        res.status(500).json({ message: "Failed to update Item Page Field" });
    }
};

module.exports = {
    all,
    item_page_fields, 
    add,
    remove,
    edit,
};
