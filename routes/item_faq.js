const express = require('express');
const router = express.Router();
const { all, add, remove, edit, item_faq, } = require("../controllers/item_faq");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', item_faq);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


