#!/usr/bin/env python

# workday.py
# show the end of the workday, calculated from earlierst morning login

import re
import subprocess
import string
import datetime

#cmdline = 'last -20 | fgrep still | fgrep hardiep'
cmdline = 'last -20 | fgrep still'

p = subprocess.Popen(cmdline, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
entries = re.split('\n+', p.stdout.read())
#print entries
times = []
for e in entries:
    if e != '':
        f = re.split(' +', e)
        #print f, len(f)
        if len(f) > 10:
            t = string.join(f[4:7])
            #print t
            times.append(t)

#print times
times.reverse()
when = datetime.datetime.strptime(times[0],'%b %d %H:%M')
#print when
then = when + datetime.timedelta(0,0,0,0,0,9,0);
#print then
print when.strftime('%a %b %d')
print 'IN: ', '%02d' % when.hour + ':' + '%02d' % when.minute
print 'OUT:', '%02d' % then.hour + ':' + '%02d' % then.minute
