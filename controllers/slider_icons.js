const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    try {
        const sliderIcons = await prisma.slider_icon.findMany();
        res.status(200).json(sliderIcons);
    } catch (error) {
        console.error(error); // Log the error
        res.status(400).json({ message: "Failed to retrieve slider icon data", error: error.message });
    }
};

const slider_icon = async (req, res) => {
    const { id } = req.params;

    try {
        const sliderIconItem = await prisma.slider_icon.findUnique({ where: { id } });

        if (!sliderIconItem) {
            return res.status(404).json({ message: "Slider icon not found" });
        }

        res.status(200).json(sliderIconItem);
    } catch (error) {
        console.error(error); // Log the error
        res.status(400).json({ message: "Failed to retrieve slider icon data", error: error.message });
    }
};

const add = async (req, res) => {
    const { cloud_icon, left_arrow_icon, right_arrow_icon } = req.body;

    if (!cloud_icon || !left_arrow_icon || !right_arrow_icon) {
        return res.status(400).json({ message: "All fields are required" });
    }

    try {
        const sliderIconItem = await prisma.slider_icon.create({
            data: { cloud_icon, left_arrow_icon, right_arrow_icon },
        });

        res.status(201).json(sliderIconItem); // Return the created item
    } catch (error) {
        console.error(error); // Log the error
        res.status(500).json({ message: "Failed to add slider icon", error: error.message });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;

    if (!id) {
        return res.status(400).json({ message: "ID is required to delete" });
    }

    try {
        await prisma.slider_icon.delete({ where: { id } });
        res.status(200).json({ message: "Slider icon deleted successfully" });
    } catch (error) {
        console.error(error); // Log the error
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Slider icon not found" });
        }

        res.status(500).json({ message: "Failed to delete slider icon", error: error.message });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const { cloud_icon, left_arrow_icon, right_arrow_icon } = req.body;

    try {
        if (!cloud_icon && !left_arrow_icon && !right_arrow_icon) {
            return res.status(400).json({ message: "No fields provided to update" });
        }

        const sliderIconItem = await prisma.slider_icon.update({
            where: { id },
            data: { cloud_icon, left_arrow_icon, right_arrow_icon },
        });

        res.status(200).json({ message: "Slider icon updated successfully", sliderIconItem });
    } catch (error) {
        console.error(error); // Log the error
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Slider icon not found" });
        }

        res.status(500).json({ message: "Failed to update slider icon", error: error.message });
    }
};

module.exports = {
    all,
    slider_icon,
    add,
    remove,
    edit,
};
