## Vagrant

- Must have Vagrant and a suitable hypervisor.  Use Virtualbox, VMare Fusion, VMware Workstation.  

- Download the desired Vagrant File, put it in a directory, and rename it "Vagrantfile"   Then simply *vagrant up*

- All examples use the ubuntu/focal64 (aka Ubunt 20.04 Vagrant compatible template "box")

- *M1 macOS examples coming soon*  Will need to use VMware Fusion

### Vagrantfiles:

VagranfileFlaskApp - Vagrant automation to build an Ubuntu Server and automate all steps to install dependencies and run the Flask Application.  At the end, the Flask app is up and running on port 5000.  

VagrantffileDockerFlaskApp - Vagrant automation that builds an Ubuntu Server, automates all steps to install Docker Engine.  The automates building the Flask Application Container and running.  At the end, the Flask App is running on port 5000 as a container.

VagrantfileDockerOnly - Vagrant automation to build an Ubuntu Server running the Docker Engine - that's it.  Log in and build and run any container.