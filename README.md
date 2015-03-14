BDVCountryNameAndCode
=====================

Easy way to get the prefix of phone numbers in a country and the name of the country (English).
It took me quite a while to find some useful arrays on this world wide web, and figured it might be a useful implementation for some.

How to use
=====================
Add BDVCountryNameAndCode.h and BDVCountryNameAndCode.m to your project.

Get prefix of current locale of user:
```objective-c
BDVCountryNameAndCode *BDVCountryNameAndCode = [[BDVCountryNameAndCode alloc] init];
NSString *prefixOfCurrentLocale = [BDVCountryNameAndCode prefixForCurrentLocale]; // Returns "+1" for Canada
```
Get the name of the current country in the same way:
```objective-c
BDVCountryNameAndCode *BDVCountryNameAndCode = [[BDVCountryNameAndCode alloc] init];
NSString *nameOfCurrentLocale = [BDVCountryNameAndCode countryNameForCurrentLocale]; // Returns "Canada"
```

Get the image flag of current locale of user:
```objective-c
BDVCountryNameAndCode *BDVCountryNameAndCode = [[BDVCountryNameAndCode alloc] init];
UIImage *flagOfCurrentLocale = [BDVCountryNameAndCode countryFlagForCurrentLocale]; // Returns UIImage
```

Easy but convenient 

TODO
=====================
- Create podspec
- Add new languages for ```[BDVCountryNameAndCode countryNameForCurrentLocale]``` 
