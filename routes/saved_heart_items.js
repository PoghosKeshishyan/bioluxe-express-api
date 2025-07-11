const express = require('express');
const router = express.Router();
const { all, add, remove, edit, saved_heart_item, } = require("../controllers/saved_heart_items");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', saved_heart_item);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;