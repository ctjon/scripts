#!/bin/bash
#
# Disable Local Backups
sudo tmutil stopbackup
sudo tmutil disablelocal
sudo tmutil disable
sudo tmutil enable
sudo tmutil startbackup
