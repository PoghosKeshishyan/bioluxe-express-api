const express = require('express');
const router = express.Router();
const { all, add, remove, edit, footer_social_link, } = require("../controllers/footer_social_links");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', footer_social_link);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;

