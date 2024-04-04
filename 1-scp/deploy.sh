#!/usr/bin/env bash

scp -r ../dumb_api root@:~/
ssh root@ << EOF
python3 ./dumb_api/main.py
EOF

#screen -S run_api
#screen -ls
