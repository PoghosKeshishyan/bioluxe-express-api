const express = require('express');
const router = express.Router();
const { all, add, remove, edit, header_icon } = require("../controllers/header_icons");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', header_icon);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;