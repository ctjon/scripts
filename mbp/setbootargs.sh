#force i386 or x86_64 architecture
nvram -p
nvram boot-args="arch=x86_64"
nvram boot-args="arch=i386"
nvram -d boot-args

#force verbose boot
nvram -p
nvram boot-args="-v"
nvram -d boot-args

#clear verbose boot
nvram -p
nvram boot-args=""
nvram -d boot-args

#safe mode boot
nvram -p
nvram boot-args="-x"
nvram -d boot-args

#clear safe mode boot
nvram -p
nvram boot-args=""
nvram -d boot-args
