const express = require('express');
const router = express.Router();
const { all, add, remove, edit, categories_link, } = require("../controllers/categories_link");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', categories_link);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


