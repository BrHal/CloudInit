# CloudInit
Some cloud-config stuff

Helpful if your VM needs network troubleshooting or has no network yet. With this tool you will be able to logion/passwd a cloud image from your local virtualization. 

mkSeed.sh is used to build a vfat cloud-init "NoCloud" compliant image file.

As a quick start : 
 - cp user-data.sample user-data
 - cp meta-data.sample meta-data
 - edit user-data (hints inside) to suit your needs
 - sudo ./mkSeed.sh 
 - attach generated img to your VM
 - create a VM with (CentOS or ubuntu cloud image) and attached img file 

Tested with kvm, CentOS image and ubuntu image, may work with others.
