const express = require('express');
const router = express.Router();
const { all, add, remove, edit, contact_info } = require("../controllers/contact_info");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', contact_info);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


