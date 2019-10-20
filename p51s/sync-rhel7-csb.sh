#!/bin/sh -x

echo "********************************************************************************"
echo "* UPDATING RHEL7-CSB Repository                                                *"
echo "********************************************************************************"
# For Repo
# 
# [rhel7-csb]
# name=RHEL7 CSB packages
# baseurl=http://hdn.corp.redhat.com/rhel7-csb-stage
# enabled=1
# gpgcheck=1
# gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-helpdesk-new
# skip_if_unavailable = 1
# keepcache = 0

export REPO=rhel7-csb
export TGTDIR=/export/install/Linux/rhel7-csb
export TGTDIR=/export/install/Linux
dnf reposync \
  --repoid=$REPO \
  -p $TGTDIR \
  #--downloadcomps 
  #--source \
  #--delete \
  #--newest-only \
  #--gpgcheck
