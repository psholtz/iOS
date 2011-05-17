#!/usr/bin/python

import json
import urllib

#
# Buffer to store JSON objects into.
#
out = []

#
# Read the input file.
#
f = open('GeoCode.in')
for line in f:

    #
    # Query the Google API
    #
    a = urllib.urlencode({'address' : line})
    a = 'http://maps.googleapis.com/maps/api/geocode/json?' + a + '&sensor=true'
    u = urllib.urlopen(a)
    d = u.read()
    out.append(d)

    #
    # Use decoder to output status to console.
    #
    s = json.JSONDecoder().decode(d)

    location = s['results'][0]['geometry']['location']
    address = s['results'][0]['formatted_address']

    print address, ":", location['lat'], location['lng']

f.close()

# 
# Write the JSON to output file.
#
f = open('GeoCode.out','w')
f.write("\r\n".join(out))
f.close()

