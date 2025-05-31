const express = require('express');
const router = express.Router();
const { all, add, remove, edit, liked_product_headings, } = require("../controllers/liked_product_heading");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', liked_product_headings);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


