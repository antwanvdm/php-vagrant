# PHP Vagrant Box
This box provides a basic box based on the 
'[bento/ubuntu-20.04](https://app.vagrantup.com/bento/boxes/ubuntu-20.04)' box.
When cloned and installed you're ready to develop PHP based applications.

This package includes the following setup:

* Nginx web server
* PHP8
* PHP8 dev tools (settings in php.ini & xdebug (*IDE Key = PHPSTORM*) installed)
* MariaDB database server
* Composer
* Default tools: htop, dos2unix, git & sendmail

Everything is installed through [ansible](https://www.ansible.com/) which allows you to 
add/change/remove packages for your own needs. Check the **_scripts/ansible/vars.yml** to 
change current packages (for example: disable php dev tools). Or check the 
scripts/templates from the current packages if you require any changes within this structure.

*Note: The old PHP7 version can be found in the php7 branch. This won't be supported anymore,
and neither receive any updates*

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

* Enter the next commands in your terminal to set up your project
(for Windows you can use 'Git bash'):

    ```
    # Clone this repository (after navigating to your dev folder)
    git clone https://github.com/antwanvdm/php-vagrant.git
    
    # Navigate in new project folder
    cd php-vagrant
    
    # Remove .git folder because we don't want to use this remote anyway
    rm -rf .git
    
    # Create the .vagrantuser file (and check the contents afterwards!)
    ./_scripts/create_vagrantuser_file.sh
    
    # Up the project (enter password in process for changing hosts file)
    vagrant up
    ```

* Go to http://php-vagrant.local to find your phpinfo() page
* If it works, you're ready to develop inside the 'public' folder!

## Other References
* [PHP](https://www.php.net/)
* [Nginx](https://www.nginx.com/resources/wiki/)
* [MariaDB](https://mariadb.org/)
* [Composer](https://getcomposer.org/)
* [Xdebug](https://xdebug.org/)

## Changelog
Please see the [CHANGELOG.md](./CHANGELOG.md)
