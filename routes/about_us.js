const express = require('express');
const router = express.Router();
const { all, add, remove, edit, about_us } = require("../controllers/about_us");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', about_us);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


