const express = require('express');
const router = express.Router();
const { all, add, remove, edit } = require("../controllers/home_page_popular_items");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.post('/add', auth, add);
router.delete('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;
