import codecs

import re
def parse(data):
    mm = re.search('\((.*?)\)', data,re.MULTILINE)
    dd = {}
    if not mm:
        return dd
    matches = re.finditer("\s*\$(.*?)\s*=\s*'(.*?)'", mm.group(1), re.MULTILINE)
    for mm in matches:
        dd[mm.group(1)] = mm.group(2)
    return dd

with codecs.open('manifests/init.pp') as ff:
     dd = parse(ff.read())
     print(dd)
