const express = require('express');
const router = express.Router();
const { all, add, remove, edit, footer_info, } = require("../controllers/footer_info");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', footer_info);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


