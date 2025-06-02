const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');
const debug = require('debug');

require('dotenv').config();

const app = express();

app.use(cors())
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', require('./routes/index'));
app.use('/api/user', require('./routes/users'));
app.use('/api/categories', require('./routes/category'));
app.use('/api/items', require('./routes/items'));
app.use('/api/popular/items', require('./routes/home_page_popular_items'));
app.use('/api/logo', require('./routes/logo'));
app.use('/api/navbar', require('./routes/navbar'));
app.use('/api/header_icons', require('./routes/header_icons'));
app.use('/api/languages', require('./routes/languages'));
app.use('/api/footer_info', require('./routes/footer_info'));
app.use('/api/footer_privacy_policy', require('./routes/footer_privacy_policy'));
app.use('/api/footer_social_links', require('./routes/footer_social_links'));
app.use('/api/slider', require('./routes/slider'));
app.use('/api/slider_icons', require('./routes/slider_icons'));
app.use('/api/categories_heading', require('./routes/homepage_categories_heading'));
app.use('/api/homepage_about_us', require('./routes/homepage_about_us'));
app.use('/api/homepage_popular_items_heading', require('./routes/homepage_popular_items_heading'));
app.use('/api/homepage_new_arrivals_heading', require('./routes/homepage_new_arrivals_heading'));
app.use('/api/homepage_contacts', require('./routes/homepage_contact'));
app.use('/api/shopping_bag_page', require('./routes/shopping_bag_page'));
app.use('/api/items_header', require('./routes/items_header'));
app.use('/api/contact_title', require('./routes/contact_title'));
app.use('/api/contact_form', require('./routes/contact_form'));
app.use('/api/contact_info', require('./routes/contact_info'));
app.use('/api/about_us', require('./routes/about_us'));
app.use('/api/about_texts', require('./routes/about_texts'));
app.use('/api/navigation_arrows', require('./routes/navigation_arrows'));
app.use('/api/saved_heart_items', require('./routes/saved_heart_items'));
app.use('/api/saved_basket_items', require('./routes/saved_basket_items'));
app.use('/api/basket_heart_view_link', require('./routes/basket_heart_view_link'));
app.use('/api/item_page_fields', require('./routes/item_page_fields'));
app.use('/api/liked_product_heading', require('./routes/liked_product_heading'));
app.use('/api/item_link', require('./routes/item_link'));
app.use('/api/infoAbout_delivery', require('./routes/infoAbout_delivery'));
app.use('/api/categories_link', require('./routes/categories_link'));
app.use('/api/list_endpoints', require('./routes/endpoints'));


module.exports = app;


app.set('port', process.env.PORT || 3000);


const server = app.listen(app.get('port'), () => {
  debug('Express server listening on port ' + server.address().port);
});