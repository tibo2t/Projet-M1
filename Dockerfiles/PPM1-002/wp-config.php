<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wordpress' );
define( 'DB_PASSWORD', 'ProjetM1' );
define( 'DB_HOST', 'mysql_database' );
//define( 'DB_HOST', 'localhost' );
//define( 'DB_CHARSET', 'utf8' );
//define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';

//define( 'WP_HOME', 'http://localhost:8081' );
//define( 'WP_SITEURL', 'http://localhost:8081' );

//define( 'FS_METHOD', 'direct' );
//define( 'AUTOMATIC_UPDATER_DISABLED', true );

//define( 'FS_CHMOD_DIR', ( 0755 & ~ umask() ) );
//define( 'FS_CHMOD_FILE', ( 0644 & ~ umask() ) );

//define('WP_DEBUG', true)

//if ( ! defined( 'ABSPATH' ) ) {
//	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
//}

require_once( ABSPATH . 'wp-settings.php' );
//define('FS_METHOD', 'direct');
