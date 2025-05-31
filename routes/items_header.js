const express = require('express');
const router = express.Router();
const { all, add, remove, edit, items_header } = require("../controllers/items_header");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', items_header);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


