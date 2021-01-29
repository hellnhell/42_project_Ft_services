<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress-db' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'toor' );

/** MySQL hostname */
/** Es el database host*/
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

define('FS_METHOD', 'direct');

/** The Database Collate type. Don't change this if in doubt.If you set it in null  */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'J8ybXzJd.#tv@~7SEhc_MD<C$;T,P*|5)ZY*B^(@v[;A&w5X/VPOl&goJVB7L.:F');
define('SECURE_AUTH_KEY',  'hL;!9?Op*JX(@k+N?nq|V~RhtV;@drz(V>=NFjhSjl{_xg>1i5D8!=gTi>DlfxkH');
define('LOGGED_IN_KEY',    '}&t5*>[jjy;|=ck]b 7I5nMlFZ5@8L]sOL 2-e9:kW2Z=ZZ$v ?*L|+(ERwV K+u');
define('NONCE_KEY',        '%<8:?gf8`+iPK+@sQz|dP|m+`+DC#DdYKj8V|Y|6gp7goR=6R|yvg 3KfCSagg6q');
define('AUTH_SALT',        '-`/kG=}A^[3m$ Hjep*VQ5Cw!b;3aG#NXO%+v~-]znp`wLI?Ij50A<+KjAgDjPcv');
define('SECURE_AUTH_SALT', '}0sG1rx|*NSr2|+M9rY,A>QTX+;Iki!=E1oy`}YR}kr2Z#|nH>0^+#[f0a==^_Zf');
define('LOGGED_IN_SALT',   'w4nUgD/334BURYhs/; 7WHhUy<4o@UyO`NXpd^c]jtMpY5/P+<Q+XF$DE=0*#3mp');
define('NONCE_SALT',       'KtY7A%b3!@vcH#VO&3B`/dZ0:;V9y7(,fFejf|2Ed7o#C<8m=)@l/(B{|oL%g; .');
/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', __DIR__ . '/var/www/wordpress' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

