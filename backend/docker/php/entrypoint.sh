#!/bin/sh
composer install
php artisan key:generate
php artisan migrate:fresh --seed
php-fpm