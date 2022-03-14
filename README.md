# PHP Vagrant Box
*2022-03-07*  
Original repository: [antwanvdm/php-vagrant](https://github.com/antwanvdm/php-vagrant)  
by [Antwan](https://github.com/antwanvdm)

This box provides a basic box based on the '[bento/ubuntu-20.04](https://app.vagrantup.com/bento/boxes/ubuntu-20.04)' box.  
When cloned and installed you're ready to develop PHP7 based applications.

This package includes the following setup:

* Nginx web server
* PHP8
* PHP8 dev tools (settings in php.ini & xdebug (*IDE Key = PHPSTORM*) installed)
* MariaDB database server
* Composer
* Default tools: htop, dos2unix, git & sendmail

Everything is installed through [ansible](https://www.ansible.com/) which allows you to add/change/remove packages for your own needs. Check the `_scripts/ansible/vars.yml` to change current packages (for example: disable php dev tools). Or check the scripts/templates from the current packages if you require any changes within this structure.

*Note: The old PHP7 version can be found in the php7 branch. This won't be supported anymore and neither receive any updates*

## Install Guide
1. For Windows users, install [Git](https://git-scm.com/download/win)
2. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) (needed to provide a virtual machine)
3. Install [Vagrant](https://www.vagrantup.com/) (easy base for development environments)
    ```bash
    #For Chocolatey Users:  
    choco install virtualbox vagrant
    ```
4. Install 2 plugins for vagrant, **nugrant** for `.vagrantuser` support & **hostmanager** to 
support a nice development URL instead of your IP (Mac: use terminal, Windows: use 'Git bash')

    ```bash
    vagrant plugin install vagrant-hostmanager
    vagrant plugin install nugrant
    ```
5. Restart Computer    
6. got to **setup guide**

- (Optional, if things do not work) Add `ForwardAgent yes` as new line in your `~/.ssh/config` file

*Please submit an issue when things do not work after doing every step*

## Setup Guide
1. Clone this repository (after navigating to your dev folder)
    ```bash
    git clone [repolink]
    ```
    repolink: https://github.com/antwanvdm/php-vagrant.git OR https://github.com/LuukFTF/php-vagrant

2. Navigate in new project folder
    ```bash
    cd php-vagrant/
    ```

3. Remove `.git` folder because we don't want to use this remote 
    ```bash
    rm -rf .git
    ```

4. Run `vagrantuser` script to create the `.vagrantuser` file.  
    ```bash
    ./_scripts/create_vagrantuser_file.sh
    ```

    <!-- BEWARE: Currently needs a manual path fix on Windows!! 
    - in the `.vagrantuser` file change the value for `local_git_path:` from `"/c/...."` to `"c:/...."` -->

    If you want to use multiple vagrant boxes:
    - change `ip_address:` to one thats not used anymore

5. Start Vagrant (grant admin in process for changing hosts file)
    ```bash
    vagrant up
    ```

6. Go to `http://[repo].local` to find your `phpinfo()` page

7. If it works, you're ready to develop inside the `/public` folder!

8. Remove all prefilled files & make new files

    ```bash
    rm -rf .git README.md CHANGELOG.md
    touch README.md CHANGELOG.md
    ```

## Starting Vagrant 

1. Open bash/terminal in local repository

2. Start Vagrant
    ```bash
    vagrant up
    ```

## Connecting

Open local website: `http://[repo].local`

### Connecting to database

In MySQL Workbench
1. Click on `Setup New Connection`
2. Set Connection Name to correstponding repository name.
3. Set Hostname to the corresponding `ip_address` in the `.vagrantuser` file (default: `192.168.50.5`)
4. Set Username & Password (default: `root`)-

## Other References
* [PHP](https://www.php.net/)
* [Nginx](https://www.nginx.com/resources/wiki/)
* [MariaDB](https://mariadb.org/)
* [Composer](https://getcomposer.org/)
* [Xdebug](https://xdebug.org/)

# Changelog
Please see the [CHANGELOG.md](./CHANGELOG.md)


---