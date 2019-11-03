# Install Jenkins - VM 

## Requirements
Make sure you have the following software installed:
- Latest version of Mac OS (optional)
- [ssh](https://www.openssh.com) should be already installed in your macOS 
- [Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) or [git](https://git-scm.com/download/mac)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)  
- [Visual Studio Code](https://code.visualstudio.com)
- [Source Tree](https://www.sourcetreeapp.com) (optional)

## VM installation steps
- Download VM from <insert link>
- Open Virtual Box
- Setup Virtualbox network  
![virtualbox_net]
- Import the VM to Virtualbox
- Check VM adaptors are ok from the settings
    - Adapter1 : NAT -> Name: n/a
    - Adapter2 : Host-only Adapter -> Name: vboxnet0

# Install Jenkins
- Open a terminal in your Mac OS X
- ssh into the VM: `ssh training@192.168.56.101` (password: password)
- Become root: `su -` (password:password)
- Check if there are packages eligible to be updated, run `apt-get update`
- Upgrade packages if any available: `apt-get dist-upgrade`
- Install Jenkins: `apt-get install jenkins`   

We expect this last step to fail because jenkins is a package that is not in the official Debian repository

- Doule check there isn't a Jenkins package available: `apt-cache search jenkins`

As we can see there is not a Jenkins package in the repository

- Download the gpg key for the Jenkins repository and add it to the trusted keys: `wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -`
- Add the Jenkins repository into the source list: `sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'`
- Check if there are packages eligible to be updated, run `apt-get update`
- Check if we have a Jenkins package available now: `apt-cache search jenkins`

We should have something similar to this in the list: 
        
jenkins - Jenkins is an open source automation server which enables developers around the world to reliably automate  their development lifecycle processes of all kinds, including build, document, test, package, stage, deployment, static analysis and many more.
    
- Install the Jenkins package: `apt-get install jenkins`
![jenkins_install]

If everything went as expected we should see an error:      
![jenkins_install_error]

- Install Jenkins dependencies: `apt-get install default-jre apt-transport-https wget`

- Complete Jenkins installation process: `apt-get install jenkins`

- Check if everythin worked correctly, open a browser and go to `192.168.56.101:8080` if everything worked as expected we should see the following page:
![jenkins_unlock]

- From your terminal get the Administrator password: `cat /var/lib/jenkins/secrets/initialAdminPassword`

- Jenkins will expose us a page where we can decide if we want to install a default set of plugins or we want to customise the installation, we will stick with the default installation:
![jenkins_plugins]

- Jenkins will download the plugins and dependencies
![jenkins_plugins_installing]

- Jenkins will ask us if the url is correct, we can save and continue and we will see the following screen:
![jenkins_ready]

- Jenkins will ask us to setup the admin user, just for the purpose of this howto (not for real cases or production servers) we can use:  
user: `root`  
password: `password`

- Now we are ready to play
![jenkins_login]


[jenkins_install]: images/01/jenkins_install.png "Jenkins install"
[jenkins_install_error]: images/01/jenkins_install_error.png "Jenkins install error"
[jenkins_login]: images/01/jenkins_login.png "Jenkins login"
[jenkins_plugins]: images/01/jenkins_plugins.png "Jenkins plugins options"
[jenkins_plugins_installing]: images/01/jenkins_plugins_installing.png "Jenkins plugins installing"
[jenkins_ready]: images/01/jenkins_ready.png "Jenkins ready"
[jenkins_unlock]: images/01/jenkins_unlock.png "Jenkins unlock page"
[virtualbox_net]: images/01/virtualbox_net.png "Virtualbox net"