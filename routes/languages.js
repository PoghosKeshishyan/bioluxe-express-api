const express = require('express');
const router = express.Router();
const { all, add, remove, edit, language, } = require("../controllers/languages");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', language);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;