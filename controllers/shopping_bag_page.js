const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const shoppingBagPages = await prisma.shopping_bag_page.findMany(lang && {
            where: { lang }
        });
        res.status(200).json(shoppingBagPages);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Shopping Bag Page data" });
    }
};

const shopping_bag_page = async (req, res) => {
    const { id } = req.params;
    try {
        const shoppingBagPage = await prisma.shopping_bag_page.findUnique({
            where: { id }
        });
        if (!shoppingBagPage) {
            return res.status(404).json({ message: "Shopping Bag Page item not found" });
        }
        res.status(200).json(shoppingBagPage);
    } catch {
        res.status(400).json({ message: "Failed to retrieve Shopping Bag Page data" });
    }
};

const add = async (req, res) => {
    const {
        lang,
        main,
        title,
        empty_error_text,
        quantity_and_prais_text,
        size_title,
        heart_text,
        btn_text,
        order_summary_field,
        total_text_field,
        form_input_name_placeholder,
        form_input_tel_placeholder,
        form_input_address_placeholder,
        form_input_checkbox_text,
        form_btn_text
    } = req.body;

    if (!lang || !main || !title || !empty_error_text || !quantity_and_prais_text ||
        !size_title || !heart_text || !btn_text || !order_summary_field || !total_text_field ||
        !form_input_name_placeholder || !form_input_tel_placeholder || !form_input_address_placeholder ||
        !form_input_checkbox_text || !form_btn_text) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const shoppingBagPage = await prisma.shopping_bag_page.create({
            data: {
                lang,
                main,
                title,
                empty_error_text,
                quantity_and_prais_text,
                size_title,
                heart_text,
                btn_text,
                order_summary_field,
                total_text_field,
                form_input_name_placeholder,
                form_input_tel_placeholder,
                form_input_address_placeholder,
                form_input_checkbox_text,
                form_btn_text
            }
        });
        res.status(201).json(shoppingBagPage);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Shopping Bag Page item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.shopping_bag_page.delete({ where: { id } });
        res.status(200).json({ message: "Shopping Bag Page item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Shopping Bag Page item not found" });
        }
        res.status(500).json({ message: "Failed to delete Shopping Bag Page item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.shopping_bag_page.update({ where: { id }, data });
        res.status(200).json({ message: "Shopping Bag Page item updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Shopping Bag Page item not found" });
        }
        res.status(500).json({ message: "Failed to update Shopping Bag Page item" });
    }
};

module.exports = {
    all,
    shopping_bag_page,
    add,
    remove,
    edit,
};
