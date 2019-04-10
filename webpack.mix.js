const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.disableSuccessNotifications();

mix
//JS
.js('resources/js/landing/landing.js', 'public/js')
.js('resources/js/app/app.js', 'public/js')

//SCSS
.sass('resources/sass/app.scss', 'public/css')
.sass('resources/sass/landing.scss', 'public/css');
