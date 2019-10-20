#if upgrading tower execute: ". /var/lib/awx/venv/ansible/bin/activate" First
pip list --format=legacy --outdated | cut -d' ' -f1 | xargs pip install --upgrade
