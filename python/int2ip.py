#!/usr/bin/env python

# int2ip.py
# convert a 32-bit integer into an IPv4 address


import sys
import string

value = long(sys.argv[1], 10)
ip = ''
mask  = 0x000000FF
j = range(0,4)
j.reverse()
for i in j:
    ip += str((value & (mask << (i * 8))) >> (i * 8))
    if i != 0:
        ip += '.'
print ip
