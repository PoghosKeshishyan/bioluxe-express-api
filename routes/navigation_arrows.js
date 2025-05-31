const express = require('express');
const router = express.Router();
const { all, add, remove, edit, navigation_arrow, } = require("../controllers/navigation_arrows");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', navigation_arrow);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;