<?php

/**
 * @file
 * Contains \DrupalProject\composer\ScriptHandler.
 */

namespace DrupalProject\composer;

use Composer\Script\Event;
use Composer\Semver\Comparator;
use DrupalFinder\DrupalFinder;
use Symfony\Component\Filesystem\Filesystem;
use Webmozart\PathUtil\Path;

class ScriptHandler {

  public static function init(Event $event) {
    $fs = new Filesystem();
    $drupalFinder = new DrupalFinder();
    $drupalFinder->locateRoot(getcwd());
    $drupalRoot = $drupalFinder->getDrupalRoot();
    $io = $event->getIO();

    // load settings from secrets else default to local
    if (!$fs->exists($drupalRoot . '/sites/default/settings.php')) {

      $fs->copy($drupalRoot . '/sites/default/local.settings.php',$drupalRoot . '/sites/default/settings.php');
      $io->write('<info>writing /var/www/html/web/sites/default/settings.php for local settings</info>.');
    }

    self::makeDefaultDirs($drupalRoot);
    self::createFilesDir($io,$drupalRoot);

    require_once $drupalRoot . '/core/includes/bootstrap.inc';
    require_once $drupalRoot . '/core/includes/install.inc';

    //$io->writeError(shell_exec("sh ./init.sh"));

    // import latest db if no config changes local,dev

  } // init

  /**
   * Checks if the installed version of Composer is compatible.
   *
   * Composer 1.0.0 and higher consider a `composer install` without having a
   * lock file present as equal to `composer update`. We do not ship with a lock
   * file to avoid merge conflicts downstream, meaning that if a project is
   * installed with an older version of Composer the scaffolding of Drupal will
   * not be triggered. We check this here instead of in drupal-scaffold to be
   * able to give immediate feedback to the end user, rather than failing the
   * installation after going through the lengthy process of compiling and
   * downloading the Composer dependencies.
   *
   * @see https://github.com/composer/composer/pull/5035
   */
  public static function checkComposerVersion(Event $event) {
    $composer = $event->getComposer();
    $io = $event->getIO();

    $version = $composer::VERSION;

    // The dev-channel of composer uses the git revision as version number,
    // try to the branch alias instead.
    if (preg_match('/^[0-9a-f]{40}$/i', $version)) {
      $version = $composer::BRANCH_ALIAS_VERSION;
    }

    // If Composer is installed through git we have no easy way to determine if
    // it is new enough, just display a warning.
    if ($version === '@package_version@' || $version === '@package_branch_alias_version@') {
      $io->writeError('<warning>You are running a development version of Composer. If you experience problems, please update Composer to the latest stable version.</warning>');
    }
    elseif (Comparator::lessThan($version, '1.0.0')) {
      $io->writeError('<error>Drupal-project requires Composer version 1.0.0 or higher. Please update your Composer before continuing</error>.');
      exit(1);
    }
  }

  /**
   * make default folders if they do not exist
   */
  private static function makeDefaultDirs($drupalRoot) {
    $fs = new Filesystem();
    $dirs = [
      'modules',
      'profiles',
      'themes',
    ];

    // Required for unit testing, create default folders if they do not exist
    foreach ($dirs as $dir) {
      if (!$fs->exists($drupalRoot . '/'. $dir)) {
        $fs->mkdir($drupalRoot . '/'. $dir);
        $fs->touch($drupalRoot . '/'. $dir . '/.gitkeep');
      }
    }
  } // makeDefaultDirs

  /**
   *
   */
  private static function createFilesDir($io,$drupalRoot) {
    $fs = new Filesystem();
    // Create the files directory with chmod 0777
    if (!$fs->exists($drupalRoot . '/sites/default/files')) {
      $oldmask = umask(0);
      $fs->mkdir($drupalRoot . '/sites/default/files', 0777);
      umask($oldmask);
      $io->write("Create a sites/default/files directory with chmod 0777");
    }
  } // makeDefaultDirs
}
