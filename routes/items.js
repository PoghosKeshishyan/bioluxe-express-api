const express = require('express');
const router = express.Router();
const { all, popular, latest, add, remove, edit, item, } = require("../controllers/items");
const { auth } = require("../middleware/auth");

router.get('/', all);
router.get('/popular', popular); 
router.get('/latest', latest); 
router.get('/:id', item);
router.post('/add', auth, add);
router.post('/remove/:id', auth, remove);
router.put('/edit/:id', auth, edit);

module.exports = router;


