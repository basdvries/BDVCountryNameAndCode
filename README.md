BDVCountryNameAndCode
=====================

Easy way to get the prefix of phone numbers in a country and the name of the country (English).
It took me quite a while to find some useful arrays on this world wide web, and figured it might be a useful implementation for some.

How to use
=====================
Add BDVCountryNameAndCode.h and BDVCountryNameAndCode.m to your project.

Get prefix of current locale of user:
```objective-c
BDVCountryNameAndCode *BDVCountryNameAndCode [[BDVCountryNameAndCode alloc] init];
NSString *prefixOfCurrentLocale = [BDVCountryNameAndCode prefixForCurrentLocale];
```
Get the name of the current country in the same way:
```objective-c
BDVCountryNameAndCode *BDVCountryNameAndCode [[BDVCountryNameAndCode alloc] init];
NSString *nameOfCurrentLocale = [BDVCountryNameAndCode countryNameForCurrentLocale];
```

Easy but convenient 
