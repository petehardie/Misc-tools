#!/usr/bin/env python

# ip2int.py
# convert an IPv4 address into a 32-bit integer 


import sys
import string

value = 0;
for i in list(enumerate(string.split(sys.argv[1], '.'))):
    value += int(i[1]) << ((3 - int(i[0])) * 8)
print value
