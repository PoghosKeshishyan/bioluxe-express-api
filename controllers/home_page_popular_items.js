const { prisma } = require("../prisma/prisma-client");

const all = async (req, res) => {
    try {
        const popularItems = await prisma.homePagePopularItem.findMany({
            orderBy: {
                order: 'asc',
            },
            include: {
                item: {
                    include: {
                        images: true,
                    }
                }
            }
        });

        const items = popularItems.map(p => p.item);
        res.status(200).json(items);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to retrieve popular items" });
    }
};

const add = async (req, res) => {
    const { itemId, order } = req.body;

    if (!itemId) {
        return res.status(400).json({ message: "itemId is required" });
    }

    try {
        const existing = await prisma.homePagePopularItem.findFirst({
            where: { itemId }
        });

        if (existing) {
            return res.status(400).json({ message: "Item already marked as popular" });
        }

        const created = await prisma.homePagePopularItem.create({
            data: {
                itemId,
                order
            }
        });

        res.status(201).json(created);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to add popular item" });
    }
};

const remove = async (req, res) => {
    const { id } = req.params;

    try {
        await prisma.homePagePopularItem.delete({
            where: { id }
        });

        res.status(200).json({ message: "Popular item removed" });
    } catch (error) {
        console.error(error);
        if (error.code === "P2025") {
            return res.status(404).json({ message: "Popular item not found" });
        }
        res.status(500).json({ message: "Failed to remove popular item" });
    }
};

const edit = async (req, res) => {
    const { id } = req.params;
    const { order } = req.body;

    try {
        const updated = await prisma.homePagePopularItem.update({
            where: { id },
            data: { order }
        });

        res.status(200).json(updated);
    } catch (error) {
        console.error(error);
        if (error.code === "P2025") {
            return res.status(404).json({ message: "Popular item not found" });
        }
        res.status(500).json({ message: "Failed to update popular item" });
    }
};

module.exports = {
    all,
    add,
    remove,
    edit
};
