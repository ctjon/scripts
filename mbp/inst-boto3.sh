#!/bin/bash
set -x
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
echo $PATH
python --version
pip install awscli boto boto3 --upgrade --user
