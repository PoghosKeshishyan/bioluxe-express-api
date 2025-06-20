const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    try {
        const items = await prisma.item.findMany({
            include: {
                images: true,
            }
        });
        res.status(200).json(items);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve items" });
    }
};

const popular = async (req, res) => {
    try {
        const popularItems = await prisma.homePagePopularItem.findMany({
            orderBy: { order: 'asc' },
            include: {
                item: true,
            },
        });
        res.status(200).json(popularItems.map(p => p.item));
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to retrieve popular items" });
    }
};

const latest = async (req, res) => {
    try {
        const items = await prisma.item.findMany({
            orderBy: {
                createdAt: 'desc'
            },
            include: {
                images: true,
            },
            take: 4,
        });

        res.status(200).json(items);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to retrieve latest items" });
    }
};

const item = async (req, res) => {
    const { id } = req.params;

    try {
        const found = await prisma.item.findUnique({
            where: { id },
            include: {
                images: true,
            },
        });

        if (!found) {
            return res.status(404).json({ message: "Item not found" });
        }

        const relatedItems = await prisma.item.findMany({
            where: {
                group_code: found.group_code,
                id: { not: id },
            },
            include: {
                images: true,
            },
        });

        res.status(200).json({ item: found, relatedItems });
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve item" });
    }
};

const add = async (req, res) => {
    const {
        category_name,
        product_number,
        price,
        heart_icon,
        title,
        btn_text,
        descr,
        product_material,
        about_delivery,
        color,
        size,
        group_code,
        images = []
    } = req.body;

    if (
        !category_name || !product_number || price === undefined || heart_icon === undefined ||
        !title || !btn_text || !descr || !product_material || !about_delivery ||
        !color || !size
    ) {
        return res.status(400).json({ message: "Все обязательные поля должны быть заполнены" });
    }

    try {
        const created = await prisma.item.create({
            data: {
                category_name,
                product_number,
                price: Number(price),
                heart_icon,
                title,
                btn_text,
                descr,
                product_material,
                about_delivery,
                color,
                size,
                group_code,
                images: {
                    create: images.map(image => ({ image }))
                }
            },
            include: {
                images: true
            }
        });

        res.status(201).json(created);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Не удалось добавить товар" });
    }
};


const remove = async (req, res) => {
    const { id } = req.params;

    try {
        await prisma.item.delete({ where: { id } });
        res.status(200).json({ message: "Item deleted successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item not found" });
        }
        res.status(500).json({ message: "Failed to delete item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const {
        category_name,
        product_number,
        price,
        heart_icon,
        title,
        btn_text,
        descr,
        product_material,
        about_delivery,
        image,
        color,
        size,
        group_code
    } = req.body;

    try {
        const updated = await prisma.item.update({
            where: { id },
            data: {
                category_name,
                product_number,
                price: Number(price),
                heart_icon,
                title,
                btn_text,
                descr,
                product_material,
                about_delivery,
                image,
                color,
                size,
                group_code
            }
        });

        res.status(200).json(updated);
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item not found" });
        }
        res.status(500).json({ message: "Не удалось обновить товар" });
    }
};

module.exports = {
    all,
    popular,
    latest,
    item,
    add,
    remove,
    edit,
};
