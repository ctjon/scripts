ssh-keygen -e -m RFC4716 -f ~/.ssh/ansible-oatakan-copy.pem > ~/.ssh/ansible-oatakan.pubaws 
ec2 import-key-pair --public-key-material file://~/.ssh/ansible-oatakan.pub  --key-name ansible-oatakan --region us-east-1
