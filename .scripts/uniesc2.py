#!/usr/bin/python
"""
Script that escapes unicode characters passed as arguments to \uXXXX format
"""
import sys

print ( ''.join([ "\\u{0:04x}".format(ord(c)) if ord(c) > 255 else c for c in \
        (' '.join(sys.argv[1:])).decode('utf-8') ])).encode('ascii','backslashreplace')

