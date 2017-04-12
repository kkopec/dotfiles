#!/usr/bin/env python3
"""
Escapes unicode characters passed as arguments to \\uXXXX format
"""
import sys

print((' '.join(sys.argv[1:])).encode('unicode_escape').decode('ascii','backslashreplace'))
