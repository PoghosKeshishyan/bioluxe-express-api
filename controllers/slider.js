const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const lang = req.query.lang || '';

    try {
        const sliders = await prisma.slider.findMany({
            where: lang ? { lang } : {}, 
        });
        res.status(200).json(sliders);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve slider data" });
    }
};

const slider = async (req, res) => {
    const { id } = req.params;

    try {
        const sliderItem = await prisma.slider.findUnique({ where: { id } });

        if (!sliderItem) {
            return res.status(404).json({ message: "Slider item not found" });
        }

        res.status(200).json(sliderItem);
    } catch (error) {
        res.status(400).json({ message: "Failed to retrieve slider data" });
    }
};

const add = async (req, res) => {
    const { lang, title, descr, btn_text, btn_url, background_image, image } = req.body;

    if (!lang || !title  || !descr || !btn_text || !btn_url || !background_image || !image) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const sliderItem = await prisma.slider.create({
            data: { lang, title, descr, btn_text, btn_url, background_image, image },
        });

        res.status(201).json(sliderItem);
    } catch (error) {
        res.status(500).json({ message: "Failed to add slider item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;

    try {
        await prisma.slider.delete({ where: { id } });
        res.status(200).json({ message: "Slider item deleted successfully" });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Slider item not found" });
        }

        res.status(500).json({ message: "Failed to delete slider item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const { lang, title, descr, btn_text, btn_url, background_image, image } = req.body;

    try {
        if (!lang && !title && !vid_url && !descr && !btn_text && !btn_url && !background_image && !image) {
            return res.status(400).json({ message: "No fields provided to update" });
        }

        const sliderItem = await prisma.slider.update({
            where: { id },
            data: { lang, title, descr, btn_text, btn_url, background_image, image },
        });

        res.status(200).json({ message: "Slider item updated successfully", sliderItem });
    } catch (error) {
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Slider item not found" });
        }

        res.status(500).json({ message: "Failed to update slider item" });
    }
};

module.exports = {
    all,
    slider,
    add,
    remove,
    edit,
};
