
<?php

/**
 * This is needed for cookie based authentication to encrypt password in
 * cookie. Needs to be 32 chars long.
 */
$cfg['blowfish_secret'] = '3Q0PzfZ4DMUj7]3e4rGnEH-eE1XA/AO0'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

/* List of env variables
*/
$vars = array(
   'PMA_HOST',
   'PMA_PORT',
   'PMA_USER',
   'MYSQL_ROOT_PASSWORD'
);

/**
* Stock env variables in tab
*/
foreach ($vars as $var) {
   $env = getenv($var);
   if (!isset($_ENV[$var]) && $env !== false) {
	   $_ENV[$var] = $env;
   }
}


/**
 * Servers configuration
 */
$i = 1;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */

$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

/**
 * phpMyAdmin configuration storage settings.
 */

/* User used to manipulate with storage */
// $cfg['Servers'][$i]['controlhost'] = '';
//  $cfg['Servers'][$i]['port'] = '3306';
//  $cfg['Servers'][$i]['controluser'] = 'root';
//  $cfg['Servers'][$i]['controlpass'] = 'toor';
 $cfg['Servers'][$i]['host'] = $_ENV['PMA_HOST'];
 $cfg['Servers'][$i]['port'] = $_ENV['PMA_PORT'];
 $cfg['Servers'][$i]['user'] = $_ENV['DB_USER'];
 $cfg['Servers'][$i]['password'] = $_ENV['DB_PASSWORD'];
/**
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';