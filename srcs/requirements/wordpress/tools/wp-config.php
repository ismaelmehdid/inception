<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
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
define( 'DB_NAME', 'wp' );

/** Database username */
define( 'DB_USER', 'wp' );

/** Database password */
define( 'DB_PASSWORD', 'usenv' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

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
define( 'AUTH_KEY',         '?)pCHS@pJfGUq_FWGrz>*F x&AEXA{q|Tk)RJdR8Pzk%;jPiWe|DTM*[g_eGO2-3' );
define( 'SECURE_AUTH_KEY',  'oyEJvo(3rE1MR3~,mT*v/egtiPf^G4(s1fB$)3yo>^woQkJ-@{q1pRN`BC|&|X|W' );
define( 'LOGGED_IN_KEY',    '*p``4Vv[,5H.5J-{o*f|;@|^X|#}0bBZS*=mh{VVc`s[um1@S:lVyq]Y8WwsFen<' );
define( 'NONCE_KEY',        '/dFM:r;+#*mf.-goi9avXVuHv(C2]@Jl$Vp{|,PJ>X.}2Sx[-*WUm(,:^g._@|9$' );
define( 'AUTH_SALT',        'SvKfR ,vWTUeBwID(l}]x[=!7j`J^j)[@0h1bB1pL%{gCY+`P2f|@v;GrqnkzKon' );
define( 'SECURE_AUTH_SALT', 'v4d1.KdZ%LoK|q>D[kkQ?jg#^9zii*OzGerOZV?1@gl+;#>Ze7Zu]^dpVIj:xPU7' );
define( 'LOGGED_IN_SALT',   '~:1(TVOk+NgLj?_}GtE^j=H2L@GH$X$M`V-]saHsW51d2_|v|765roJ?L_[MLcFZ' );
define( 'NONCE_SALT',       's*k7jK)eUyy0a.,D?]mW7LIj$l!bvQf^6+M4Lt4wCtcUWn[5./B<s;F`-p?M{4~f' );

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
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';