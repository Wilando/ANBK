import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/myapp.css',
                'resources/css/myauth.css',
                'resources/css/mydatatable.css',
                'resources/css/mybootstrap.css',
                'resources/css/mytinymce.css',
                'resources/js/myapp.js',
                'resources/js/mydatatable.js',
                'resources/js/mychart.js',
                'resources/css/myauth.css',
                'resources/js/myauth.js',
                'resources/js/mytinymce.js',
            ],
            // refresh: true,
        }),
    ],
    resolve: {
        alias: {
            '$': 'jQuery',
            'jquery': 'jQuery',
        },
    },
});
