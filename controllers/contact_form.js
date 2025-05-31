const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';
    try {
        const forms = await prisma.contact_form.findMany(
            lang ? { where: { lang } } : {}
        );
        res.status(200).json(forms);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Contact Form data" });
    }
};

const contact_form = async (req, res) => {
    const { id } = req.params;
    try {
        const form = await prisma.contact_form.findUnique({ where: { id } });
        if (!form) {
            return res.status(404).json({ message: "Contact Form not found" });
        }
        res.status(200).json(form);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve Contact Form" });
    }
};

const add = async (req, res) => {
    const {
        lang,
        title,
        input_placeholder_name,
        input_placeholder_email,
        input_placeholder_phone,
        btn_text,
        priacy_policy_text,
        priacy_policy_url
    } = req.body;

    if (
        !lang || !title || !input_placeholder_name || !input_placeholder_email ||
        !input_placeholder_phone || !btn_text || !priacy_policy_text || !priacy_policy_url
    ) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const newForm = await prisma.contact_form.create({
            data: {
                lang,
                title,
                input_placeholder_name,
                input_placeholder_email,
                input_placeholder_phone,
                btn_text,
                priacy_policy_text,
                priacy_policy_url
            }
        });
        res.status(201).json(newForm);
    } catch (error) {
        res.status(500).json({ message: "Failed to add Contact Form" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.contact_form.delete({ where: { id } });
        res.status(200).json({ message: "Contact Form deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Contact Form not found" });
        }
        res.status(500).json({ message: "Failed to delete Contact Form" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    try {
        await prisma.contact_form.update({ where: { id }, data });
        res.status(200).json({ message: "Contact Form updated successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Contact Form not found" });
        }
        res.status(500).json({ message: "Failed to update Contact Form" });
    }
};

module.exports = {
    all,
    contact_form,
    add,
    remove,
    edit,
};
