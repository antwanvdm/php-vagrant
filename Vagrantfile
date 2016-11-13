# -*- mode: ruby -*-
# vi: set ft=ruby :
# Do not make any changes in this file unless you know what you're doing.

Vagrant.configure(2) do |config|

  # Enables hostmanager plugin
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  # Make sure you put in 'ForwardAgent yes' as new line in your ~/.ssh/config file
  config.ssh.forward_agent = true

  # Set the default variables (Retrieved from .vagrantuser)
  projectname_string = config.user.project.name
  projectipaddress_string = config.user.project.ip_address
  projectdirectory_string = config.user.project.local_git_path

  config.vm.define projectname_string do |projectname|
    # Load the base vagrant box
    projectname.vm.box = "boxcutter/ubuntu1604"
    projectname.vm.synced_folder projectdirectory_string, "/var/source", owner: "vagrant", group: "www-data"

    # Packages through ansible
    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "_scripts/ansible/main.yml"
        ansible.install = true
        ansible.version = "latest"
        ansible.raw_arguments = ["--extra-vars='projectname="+projectname_string+"'"]
    end

    # Set the Hostname (default = projectname +.dev)
    projectname.vm.hostname = projectname_string+".dev"

    # Set the default ip (You cannot have multiple boxes running on the same host with the same ip)
    projectname.vm.network "private_network", ip: projectipaddress_string

    # Configure portforwarding for nginx (visit IP from client on the given port. Example: http://192.128.1.195:4567)
    projectname.vm.network :forwarded_port, host: 4567, guest: 80, auto_correct: true

    # Set the Virtual Machine Settings
    projectname.vm.provider config.user.project.provider do |v|

      # Set the allowed memory
      v.memory = config.user.project.vagrant_max_memory
      # Set some option to allow windows to create symlinks for
      v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

    end
  end
end

