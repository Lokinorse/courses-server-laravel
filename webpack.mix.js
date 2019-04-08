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

mix.js('resources/js/cabinet.js', 'public/js')
	.js('resources/js/sublanding.js', 'public/js')
	.js('resources/js/landing.js', 'public/js')
	.js('resources/js/cheatsheet.js', 'public/js')
	.sass('resources/sass/app.scss', 'public/css')
	.sass('resources/sass/vkapp.scss', 'public/css')
	.sass('resources/sass/landing.scss', 'public/css');
