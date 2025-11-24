<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('WP_CACHE', true);
define('WP_MEMORY_LIMIT', '256M' );
define( 'WPCACHEHOME', '/home/d0q72qc8x2kq/public_html/campus-abroad.co.in/showcase/wp-content/plugins/wp-super-cache/' );
define( 'DB_NAME', "campus-abroad" );

/** Database username */
define( 'DB_USER', "campus-abroad" );

/** Database password */
define( 'DB_PASSWORD', "daorba-supmaC" );

/** Database hostname */
define( 'DB_HOST', "localhost" );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '_GII;&@Tod>|!I)c.PVxeNV,aC3Q`P8w`ei<T5~w)eQRqGbWB+3LXOe}G!wkDfzb' );
define( 'SECURE_AUTH_KEY',  'xcpa-><R~];:SOI0#A-a+3@.KI( Ax}]c_f%1rqVd^)d>]8X4G`9CJ,_XMYl)Sfx' );
define( 'LOGGED_IN_KEY',    '$JfU$W;?t<Npo!9~u3A-0E5S>{{_qYb=cxaz8t6*C/R]Oo~^264L8MeDBMn3-V,p' );
define( 'NONCE_KEY',        '0HH/Jmm!e=gz:E0s>`~TKu2=2AWj<$]l4zX-?E]w)DK3Hht=x9~D,}:|$@OQ}LW!' );
define( 'AUTH_SALT',        '5&g(Ed.5:/*Wmnd;Xb*jxUI4wg IS^=0TI:y`{i~oB0e.!X96dZ*hq(pf$>6@GJj' );
define( 'SECURE_AUTH_SALT', '#kX:=1cjxiSGPyv3^?5$PJ3:(&E;tXE|Nqa~YL.qLnx]cRD0B>UJ{YQH,JB%57l6' );
define( 'LOGGED_IN_SALT',   'w%qqUY1kQxPCw3T*]^e@!f>xypJkaoM/,n Jxk]40 _s{*W7U4^1TF]NTL9MFHA*' );
define( 'NONCE_SALT',       '.F%pX&VLT{UX5P*lel6@Dfdjn4<VDk)nN7peX?,!5my_%:fTE74hVc&GB_To=F]0' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname(__FILE__) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
