// const express = require('express');
// const router = express.Router();
// const {register, login} = require('../controllers/users');

// router.post('/register', register);
// router.post('/login', login);

// module.exports = router;

const express = require('express');
const router = express.Router();
const {register, login} = require('../controllers/users');

router.post('/register', register);
router.post('/login', login);

module.exports = router;