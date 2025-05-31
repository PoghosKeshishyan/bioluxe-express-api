const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    const { category } = req.query;

    try {
        const items = await prisma.item.findMany({
            where: category ? { category_name: category } : undefined,
            include: {
                images: true,
                sizes: true,
            }
        });
        res.status(200).json(items);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Failed to retrieve items" });
    }
};

const latest = async (req, res) => {
    try {
        const items = await prisma.item.findMany({
            orderBy: {
                createdAt: 'desc'
            },
            take: 4,
            include: {
                images: true,
                sizes: true
            }
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
                sizes: true,
            }
        });

        if (!found) {
            return res.status(404).json({ message: "Item not found" });
        }

        res.status(200).json(found);
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
        images,
        sizes
    } = req.body;

    if (
        !category_name || !product_number || !price || !heart_icon === undefined ||
        !title || !btn_text || !descr || !product_material || !about_delivery
    ) {
        return res.status(400).json({ message: "All required fields must be filled" });
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
                images: {
                    create: images?.map((img) => ({ image: img.image })) || []
                },
                sizes: {
                    create: sizes?.map((s) => ({
                        size: s.size,
                        status: s.status
                    })) || []
                }
            },
            include: {
                images: true,
                sizes: true
            }
        });

        res.status(201).json(created);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to add item" });
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
        images,
        sizes
    } = req.body;


    try {
        await prisma.item.update({
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
            }
        });

        await prisma.productImage.deleteMany({ where: { productId: id } });
        await prisma.productSize.deleteMany({ where: { productId: id } });

        await prisma.item.update({
            where: { id },
            data: {
                images: {
                    create: images?.map((img) => ({ image: img.image })) || []
                },
                sizes: {
                    create: sizes?.map((s) => ({
                        size: s.size,
                        status: s.status
                    })) || []
                }
            }
        });

        res.status(200).json({ message: "Item updated successfully" });
    } catch (error) {
        console.error(error);
        if (error.code === 'P2025') {
            return res.status(404).json({ message: "Item not found" });
        }
        res.status(500).json({ message: "Failed to update item" });
    }
};

module.exports = {
    all,
    latest,
    item,
    add,
    remove,
    edit,
};
