#!/bin/bash
fail2ban-client status
fail2ban-client set sshd unbanip 172.16.1.9
