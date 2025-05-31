const express = require('express');
const router = express.Router();
const { all, add, remove, edit, footer_privacy_policy, } = require("../controllers/footer_privacy_policy");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', footer_privacy_policy);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


