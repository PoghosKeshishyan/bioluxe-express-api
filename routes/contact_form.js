const express = require('express');
const router = express.Router();
const { all, add, remove, edit, contact_form } = require("../controllers/contact_form");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', contact_form);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


