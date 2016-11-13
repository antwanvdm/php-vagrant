# PHP7 Vagrant Box
This box provides a basic box based on the '[boxcutter/ubuntu1604](https://atlas.hashicorp.com/box-cutter/boxes/ubuntu1604)' box.
When cloned and installed you're ready to develop PHP7 based applications.

This package includes the following setup:

* Nginx web server
* PHP7
* PHP7 dev tools (settings in php.ini & xdebug installed)
* MariaDB database server
* Composer
* Default tools: htop, dos2unix, git & sendmail
* Phalcon 3

Everything is contained through [Ansible](https://www.ansible.com/) which allows you to add/change/remove packages for your own needs.
Check the _scripts/ansible/vars.yml to change current packages (for example: disable phalcon or php7 dev tools)

## Install guide
* Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) (needed to provide a virtual machine)
* Install [Vagrant](https://www.vagrantup.com/) (easy base for development environments)
* Install 2 plugins for vagrant, nugrant for .vagrantuser support & hostmanager to support a nice development URL instead of your IP
    ```
    vagrant plugin install nugrant
    vagrant plugin install vagrant-hostmanager
    ```
* For Windows users, download and install [Git](https://git-scm.com/download/win)
* For the next commands, make sure you'll use a linux supported (for Windows: Git bash) shell:
    ```
    # Clone this repository
    git clone https://github.com/***.git
    ...
    # Navigate in new project folder
    cd ***.git
    ...
    # Create the .vagrantuser file (and check them afterwards)
    ./_scripts/create_vagrantuser_file.sh
    ...
    # Up the project
    vagrant up
    ```
* Go to http://php7.dev to find your phpinfo() page
* You're ready to develop inside the 'public' folder!

## Other References
* [Nginx](https://www.nginx.com/resources/wiki/)
* [MariaDB](https://mariadb.org/)
* [Composer](https://getcomposer.org/)
* [Xdebug](https://xdebug.org/)
* [Phalcon](https://phalconphp.com/en/)

## Changelog
### v1.0.0
* First version, tested on virtualbox 5.0.26 & vagrant 1.8.5
