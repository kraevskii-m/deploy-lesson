#!/usr/bin/env bash

scp -r ../dumb_api root@164.92.233.98
ssh root@164.92.233.98 << EOF
python3 main.py
EOF

#screen -S run_api
#screen -ls
