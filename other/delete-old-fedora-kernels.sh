#!/bin/bash
dnf --setopt=protected_packages remove $(dnf repoquery --installonly --latest-limit=-2 -q)
