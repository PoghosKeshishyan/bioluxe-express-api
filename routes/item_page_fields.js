const express = require('express');
const router = express.Router();
const { all, add, remove, edit, item_page_fields, } = require("../controllers/item_page_fields");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', item_page_fields);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


