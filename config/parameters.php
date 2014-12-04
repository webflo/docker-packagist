<?php

/**
 * @file app/config/parameters.php
 */

function getenv_else($env_var_name, $default = null) {
  $value = getenv($env_var_name);
  return $value !== $default ? $value : $default;
}

$container->setParameter('database_driver', 'pdo_mysql');

if(@$_SERVER['RDS_HOSTNAME']) {
  $container->setParameter('database_host', $_SERVER['RDS_HOSTNAME']);
  $container->setParameter('database_port', $_SERVER['RDS_PORT']);
  $container->setParameter('database_name', $_SERVER['RDS_DB_NAME']);
  $container->setParameter('database_user', $_SERVER['RDS_USERNAME']);
  $container->setParameter('database_password', $_SERVER['RDS_PASSWORD']);
} else {
  $container->setParameter('database_host', getenv_else('MYSQL_DATABASE_HOST', '127.0.0.1'));
  $container->setParameter('database_port', getenv_else('MYSQL_DATABASE_PORT'));
  $container->setParameter('database_name', getenv_else('MYSQL_DATABASE_NAME', 'packagist'));
  $container->setParameter('database_user', getenv_else('MYSQL_DATABASE_USER', 'root'));
  $container->setParameter('database_password', getenv_else('MYSQL_DATABASE_PASSWORD'));
}

$container->setParameter('mailer_transport', getenv_else('MAILER_TRANSPORT', 'smtp'));
$container->setParameter('mailer_host', getenv_else('MAILER_HOST', '127.0.0.1'));
$container->setParameter('mailer_user', getenv_else('MAILER_USER'));
$container->setParameter('mailer_password', getenv_else('MAILER_PASSWORD'));
$container->setParameter('mailer_from_email', getenv_else('MAILER_FROM_EMAIL',  'admin@example.org'));
$container->setParameter('mailer_from_name', getenv_else(' MAILER_FROM_NAME', 'Admin Team'));
$container->setParameter('locale', getenv_else('LOCALE', 'en_US'));
$container->setParameter('secret', getenv_else('SECRET'));
$container->setParameter('remember_me.secret', getenv_else('REMEMBER_ME_SECRET'));
$container->setParameter('debug_toolbar', getenv_else('DEBUG_TOOLBAR', false));
$container->setParameter('debug_redirects', getenv_else('DEBUG_REDIRECTS', false));
$container->setParameter('use_assetic_controller',getenv_else('USE_ASSETIC_CONTROLLER', false));
$container->setParameter('packagist_host', getenv_else('PACKAGIST_HOST', 'packagist'));
$container->setParameter('redis_dsn', getenv_else('REDIS_DSN', 'redis://localhost/1'));
$container->setParameter('google_analytics.ga_key', getenv_else('GA_KEY'));
$container->setParameter('github.client_id', getenv_else('GITHUB_CLIENT_ID'));
$container->setParameter('github.client_secret', getenv_else('GITHUB_CLIENT_SECRET'));
$container->setParameter('validation_cache_backend', getenv_else('VALIDATION_CACHE_BACKEND'));
$container->setParameter('doctrine_cache_backend', getenv_else('DOCTRINE_CACHE_BACKEND'));
$container->setParameter('force_ssl', getenv_else('FORCE_SSL', false));
$container->setParameter('trusted_proxies', getenv_else('TRUSTED_PROXIES'));
$container->setParameter('trusted_hosts', getenv_else('TRUSTED_HOSTS'));
