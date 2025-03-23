#!/bin/bash

semanage fcontext -a -t public_content_rw_t '/export/install(/.*)?'
semanage fcontext -a -t public_content_rw_t '/var/run/media/chris/Archive(/.*)?'
setsebool -P samba_enable_home_dirs 1
restorecon -FRv /export
restorecon -FRv /var/run/media/chris
