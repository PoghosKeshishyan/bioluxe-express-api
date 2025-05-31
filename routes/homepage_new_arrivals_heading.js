const express = require('express');
const router = express.Router();
const { all, add, remove, edit, homepage_new_arrivals_heading, } = require("../controllers/homepage_new_arrivals_heading");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/:id', homepage_new_arrivals_heading);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


