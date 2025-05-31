const express = require('express');
const router = express.Router();
const { all, add, remove, edit, slider_icon, } = require("../controllers/slider_icons");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', slider_icon);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;