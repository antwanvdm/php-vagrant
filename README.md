# PHP7 Vagrant Box
This box provides a basic box based on the 
'[bento/ubuntu-18.04](https://app.vagrantup.com/bento/boxes/ubuntu-18.04)' box.
When cloned and installed you're ready to develop PHP7 based applications.

This package includes the following setup:

* Nginx web server
* PHP7
* PHP7 dev tools (settings in php.ini & xdebug (*IDE Key = PHPSTORM*) installed)
* MariaDB database server
* Composer
* Default tools: htop, dos2unix, git & sendmail
* Phalcon 3

Everything is installed through [ansible](https://www.ansible.com/) which allows you to 
add/change/remove packages for your own needs. Check the **_scripts/ansible/vars.yml** to 
change current packages (for example: disable phalcon or php7 dev tools). Or check the 
scripts/templates from the current packages if you require any changes within this structure.

## Install guide
* Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) (needed to provide a 
virtual machine)
* Install [Vagrant](https://www.vagrantup.com/) (easy base for development environments)
* For Windows users, install [Git](https://git-scm.com/download/win)
* Install 2 plugins for vagrant, **nugrant** for .vagrantuser support & **hostmanager** to 
support a nice development URL instead of your IP (for Windows you can use 'Git bash')

    ```
    vagrant plugin install vagrant-hostmanager
    vagrant plugin install nugrant
    ```

* (Optional, please file an issue when things break without) Add 'ForwardAgent yes' as new 
line in your **~/.ssh/config** file
* Enter the next commands to setup your project (for Windows you can use 'Git bash'):

    ```
    # Clone this repository (after navigating to your dev folder)
    git clone https://github.com/antwanvdm/php7-vagrant.git
    ...
    # Navigate in new project folder
    cd php7-vagrant
    ...
    # Remove .git folder because we don't want to use this remote anyway
    rm -rf .git
    ...
    # Create the .vagrantuser file (and check them afterwards.
    # BEWARE: Currently needs a manual path fix on Windows!!
    ./_scripts/create_vagrantuser_file.sh
    ...
    # Up the project (enter password in process for changing hosts file)
    vagrant up
    ```

* Go to http://php7-vagrant.local to find your phpinfo() page
* You're ready to develop inside the 'public' folder!

## Other References
* [Nginx](https://www.nginx.com/resources/wiki/)
* [MariaDB](https://mariadb.org/)
* [Composer](https://getcomposer.org/)
* [Xdebug](https://xdebug.org/)
* [Phalcon](https://phalconphp.com/en/)

## Changelog
### v1.0.7
* Fix for ansible crash while trying to install

### v1.0.6
* Set a fixed number for the vagrant bento box to prevent composer issues

### v1.0.5
* Added php7.2-xml library, mainly because phpunit requires it.

### v1.0.4
* Upgraded to bento/ubuntu-18.04, tested on virtualbox 5.2.18, vagrant 2.1.5
* Upgraded to php7.2 versions, and removed mcrypt package for now (not available anymore..)
* Fixed Phalcon repository URL which was moved

### v1.0.3
* Updated README
* Updated local url to .local instead of .dev (Google Chrome future support)
* Updated basebox to bento/ubuntu-16.04 instead of boxcutter/ubuntu1604 due to 404/403 errors
* Tested on virtualbox 5.2.0, vagrant 2.0.1 and bento/ubuntu-16.04 v201710.25.0

### v1.0.2
* Cleaned up nginx/php7 configuration files
* Fixed caching issues with non-php files
* Updated README for Windows users
* Updated documentation/comments

### v1.0.1
* Added bugfix for ['cable connected issue'](https://lists.debian.org/debian-cloud/2016/09/msg00051.html)
* Run 'sudo rm /opt/vagrant/embedded/bin/curl' if downloading the box fails
* Updated documentation/comments

### v1.0.0
* First version, tested on virtualbox 5.0.28, vagrant 1.8.7 and boxcutter/ubuntu1604 2.0.23
