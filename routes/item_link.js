const express = require('express');
const router = express.Router();
const { all, add, remove, edit, item_links, } = require("../controllers/item_link");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', item_links);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


