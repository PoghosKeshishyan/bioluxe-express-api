const express = require('express');
const router = express.Router();
const { all, add, remove, edit, saved_basket_item, } = require("../controllers/saved_basket_items");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', saved_basket_item);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;