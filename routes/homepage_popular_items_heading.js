const express = require('express');
const router = express.Router();
const { all, add, remove, edit, homepage_popular_item_heading, } = require("../controllers/homepage_popular_items_heading");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', homepage_popular_item_heading);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


