const express = require('express');
const router = express.Router();
const { all, add, remove, edit, homepage_about_us, } = require("../controllers/homepage_about_us");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', homepage_about_us);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


