#!/bin/bash

pass=$(/usr/bin/pwgen -s 24 1)
echo password: $pass
hash=$(echo $pass | /usr/bin/mkpasswd --method=SHA-512 --stdin)
echo hash-512: $hash
