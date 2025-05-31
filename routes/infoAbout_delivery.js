const express = require('express');
const router = express.Router();
const { all, add, remove, edit, info_about_delivery, } = require("../controllers/infoAbout_delivery");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', info_about_delivery);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


