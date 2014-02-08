#!/bin/bash
wget http://checkip.dyndns.org/ 1 -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1
