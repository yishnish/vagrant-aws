# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
require 'vagrant-aws'
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # config.vm.box = "dummy-aws"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 3000, host: 80

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

 # Specify AWS provider configuration
  config.vm.provider 'aws' do |aws, override| 
	aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
	aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
	
	# Specify SSH keypair to use
	aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
	
	# Specify username and private key path
	override.ssh.username = ENV['AWS_SSH_USERNAME']
	override.ssh.private_key_path = ENV['AWS_PRIVATE_KEY_PATH']
	
	# instance configuration
	aws.ami = ENV['AMI_ID']
	aws.region = ENV['EC2_INSTANCE_REGION']
	aws.security_groups = ENV['EC2_INSTANCE_SECURITY_GROUPS'].split(',').map(&:strip)
	aws.instance_type = ENV['EC2_INSTANCE_TYPE']
	aws.tags["Name"] = ENV['EC2_INSTANCE_NAME']
	
	override.vm.box = "dummy-aws"
  end

 
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

   config.vm.provision :shell, inline: <<-SHELL
	apt-get update
	
	#install git
	#git seems to already be installed

	
	#--------------NODE-------------------------
	#install node
        curl -sL https://deb.nodesource.com/setup_4.x | sh
        apt-get install -y nodejs
	#--------------NODE-------------------------	


#------------------------RVM & RUBY------------------------------
        apt-get install -y software-properties-common
        apt-add-repository -y ppa:rael-gc/rvm
        apt-get update
        apt-get install -y rvm
        /usr/share/rvm/bin/rvm install ruby
	#------------------------RVM & RUBY------------------------------


        #------------------------JAVA AND MAVEN------------------------------------
#       #install open-jdk
#       apt-get install -y openjdk-8-jdk
#        
#       #install maven
#       apt-get install -y maven
#       #------------------------JAVA AND MAVEN------------------------------------		


        #----------------DOCKER------------------------
        #install docker
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        apt-get update
        apt-cache policy docker-ce
        apt-get install -y docker-ce

        usermod -aG docker "#{ENV['AWS_SSH_USERNAME']}"

        #restart docker to pick up the group change
        service docker restart
        #try to force reload of user so group change takes effect
        sudo su - "#{ENV['AWS_SSH_USERNAME']}"
        #----------------DOCKER------------------------
   SHELL
 
end
