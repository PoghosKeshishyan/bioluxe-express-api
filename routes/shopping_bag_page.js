const express = require('express');
const router = express.Router();
const { all, add, remove, edit, shopping_bag_page, } = require("../controllers/shopping_bag_page");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', shopping_bag_page);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;