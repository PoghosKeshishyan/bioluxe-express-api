const express = require('express');
const router = express.Router();
const { all, add, remove, edit, logo, } = require("../controllers/logo");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', logo);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;