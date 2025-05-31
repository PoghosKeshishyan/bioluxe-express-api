const express = require('express');
const router = express.Router();
const { all, add, remove, edit, basket_heart_view_link, } = require("../controllers/basket_heart_view_link");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', basket_heart_view_link);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;