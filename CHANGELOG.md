# Changelog
This file contains the documentation per tag release within this repository.

## v3.0.0
* Upgrade to PHP 8.0

## v2.1.1
* Small fix to enable develop mode in xDebug
* Move changelog to separate file

## v2.1.0
* Small fix for vagrant host-manager (host didn't get added), verified with vagrant 2.2.14 (!)
  Please note vagrant 2.2.13 will not work due to a minor issue in this version
* Added ondrej/php repo to keep more up-to-date with PHP updates
* Implemented xDebug 3 in template

## v2.0.0
* Upgraded to the Ubuntu 20.04 box
* Upgraded PHP to PHP 7.4 (and all related packages / settings)
* Fixed nginx location to install package from default repository
* Tested with virtualbox 6.1.16 & vagrant 2.2.13
* Removed Phalcon from the box to keep it as clean as possible for a base box
* Clean up the mess in the ansible folders to have focus on what is required

## v1.0.7
* Fix for ansible crash while trying to install

## v1.0.6
* Set a fixed number for the vagrant bento box to prevent composer issues

## v1.0.5
* Added php7.2-xml library, mainly because phpunit requires it.

## v1.0.4
* Upgraded to bento/ubuntu-18.04, tested on virtualbox 5.2.18, vagrant 2.1.5
* Upgraded to php7.2 versions, and removed mcrypt package for now (not available anymore..)
* Fixed Phalcon repository URL which was moved

## v1.0.3
* Updated README
* Updated local url to .local instead of .dev (Google Chrome future support)
* Updated basebox to bento/ubuntu-16.04 instead of boxcutter/ubuntu1604 due to 404/403 errors
* Tested on virtualbox 5.2.0, vagrant 2.0.1 and bento/ubuntu-16.04 v201710.25.0

## v1.0.2
* Cleaned up nginx/php7 configuration files
* Fixed caching issues with non-php files
* Updated README for Windows users
* Updated documentation/comments

## v1.0.1
* Added bugfix for ['cable connected issue'](https://lists.debian.org/debian-cloud/2016/09/msg00051.html)
* Run 'sudo rm /opt/vagrant/embedded/bin/curl' if downloading the box fails
* Updated documentation/comments

## v1.0.0
* First version, tested on virtualbox 5.0.28, vagrant 1.8.7 and boxcutter/ubuntu1604 2.0.23
