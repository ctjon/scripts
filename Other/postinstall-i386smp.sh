#!/bin/bash
set -x
#
# Obtain Latest Updates of Installed Packages
#
yum -y update

#
# Install RPMs from my Repository
#
rpm -ivh /install/kickstart/FC5/FC5-i386/updates/kernel-smp-devel-2.6.17-1.2187_FC5.i686.rpm
rpm -ivh /install/kickstart/otherRPMS/i386/cedega-small-5.2.3-1.i386.rpm
rpm -ivh /install/kickstart/otherRPMS/i386/crossover-pro-5.0.3-1.i386.rpm
rpm -ivh /install/kickstart/otherRPMS/i386/nerolinux-2.1.0.1-x86.rpm
rpm -ivh /install/kickstart/otherRPMS/i386/jdk-1_5_0_08-linux-i586.rpm
ln -s /usr/java/jdk1.5.0_08/jre/plugin/i386/ns7/libjavaplugin_oji.so /usr/lib/firefox-1.5.0.7/plugins/libjavaplugin_oji.so
rpm -Fvh /install/kickstart/otherRPMS/i386/nmap-4.11-1.i386.rpm /install/kickstart/otherRPMS/i386/nmap-frontend-4.11-1.i386.rpm
rpm -ivh /install/kickstart/otherRPMS/i386/msttcorefonts-2.0-1.noarch.rpm
rpm -ivh /archive/VMware/vmwareServer-1.0.1/VMware-server-1.0.1-29996.i386.rpm

#
# Install Special RPMs from rpm.livna.org, extras etc.
#
rpm -ivh http://rpm.livna.org/livna-release5.rpm 
yum -y install kmod-nvidia-smp xorg-x11-drv-nvidia
yum -y install kmod-ntfs-smp
yum -y install ncftp
yum -y install totem-xine
yum -y install bridge-utils
yum -y install openvpn
yum -y install ddclient
yum -y install mplayerplug-in
yum -y install gstreamer-plugins-ugly
yum -y install amarok
yum -y install amarok-extras-nonfree
yum -y install bittorrent
yum -y install bittorrent-gui
yum -y install glabels
yum -y install perl-Gtk2
yum -y install kino
mkdir /usr/local/sh
chmod 755 /usr/local/sh
cp /archive/Linux/src/gscan2pdf-0.6.2/gscan2pdf /usr/local/sh/gscan2pdf
chmod 755 /usr/local/sh/gscan2pdf

#
# Install Macromedia Flash
#
echo "[macromedia]
name=Macromedia for i386 Linux
baseurl=http://macromedia.rediris.es/rpm/
enabled=1
gpgcheck=1
gpgkey=http://macromedia.mplug.org/FEDORA-GPG-KEY" >/etc/yum.repos.d/macromedia.repo
yum -y install flash-plugin
