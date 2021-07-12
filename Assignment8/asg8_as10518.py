# -*- coding: utf-8 -*-

import json
from urllib.request import urlopen
'''url = 'http://media.mongodb.org/zips.json'
with urlopen(url) as response:
    source = response.read()
    my_json = source.decode('utf8').replace("'", '"')
    with open('zips.json','w') as f:
        json.dump(my_json,f)
        print(type(f))'''