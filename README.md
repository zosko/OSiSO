# Simple OS

## Downloads
- Download VirtualBox - https://virtualbox.org/
- Download minimal CentOS.iso - https://centos.org/

## Prepare development environment
- sudo yum -y install gcc nasm tk
- sudo yum -y install gcc-c++ glibc-devel glibc-static libstdc++\* glibc.i686

### This app is used to create ISO file
```
# wget http://www.gnu.org/software/xorriso/xorriso-1.4.2.tar.gz
# tar -zxvf xorriso-1.4.2.tar.gz
# cd xorriso-1.4.2
# ./configure
# make
# sudo make install
``` 

**TCP / IP**: https://github.com/adamdunkels/uip
