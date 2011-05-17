Utilities
=========

GeoCode.py
---------- 

Strictly speaking, this isn't iOS Objective-C code, although I do use this code somewhat frequently when developing on iOS.

It's a quick python script that geocodes addresses:

* Addresses are supplied in a file named **GeoCode.in**.

* Full JSON responses from Google are saved in a file named **GeoCode.out**. 

Parsed output is written to console as it is downloaded from Google:

```
123 E 54th St, New York, NY 10022, USA : 40.759369 -73.971312
350 5th Ave, New York, NY 10001, USA : 40.74807 -73.984959
1855 Broadway, New York, NY 10023, USA : 40.7696147 -73.9824137
1st Ave & E 44th St, New York, NY 10017, USA : 40.7500828 -73.9687915
405 Lexington Ave, New York, NY 10174, USA : 40.7519315 -73.975584
Times Square, New York, NY, USA : 40.7560857 -73.9859448
Church St, New York, NY 10006, USA : 40.71128 -74.01064
30 Rockefeller Plaza, New York, NY 10112, USA : 40.759139 -73.979723
830 5th Ave, New York, NY 10065, USA : 40.767393 -73.970695
```

UIDeviceHardware
----------------

There are times when it's useful to know exactly what sort of hardware your iOS app is running on. 

The UIDeviceHardware class uses low-level C APIs to discover exactly what version of iPod, iPhone
or iPad hardware your application is running on.

[![](http://farm6.static.flickr.com/5303/5607820823_e0f6546f0e_z.jpg)](http://farm6.static.flickr.com/5303/5607820823_e0f6546f0e_z.jpg)
