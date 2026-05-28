//
//  BDVCountryNameAndCode.h
//  BDVCountryNameAndCode
//
//  Created by Bas de Vries on 22-10-14.
//  Copyright (c) 2014 Bas de Vries. All rights reserved.
//

#import <Foundation/Foundation.h>
#if __has_include(<UIKit/UIKit.h>)
#import <UIKit/UIKit.h>
#endif

@interface BDVCountryNameAndCode : NSObject {
    NSArray *BDVCountryNameAndCodePlist;
    NSMutableDictionary *dictDialingCodes;
    NSMutableArray *countryNames;
    NSMutableArray *prefixDialingCodes;
}

-(instancetype)initWithPlistPath:(NSString *)plistPath;

-(NSString *)prefixForCurrentLocale;
-(NSString *)countryNameForCurrentLocale;
#if __has_include(<UIKit/UIKit.h>)
-(UIImage *)countryFlagForCurrentLocale;
#endif

-(NSString *)prefixForCountryCode:(NSString *)countryCode;
-(NSString *)countryNameAtIndex:(NSUInteger)index;
-(NSArray<NSString *> *)allCountryNames;
-(NSArray<NSString *> *)allPrefixDialingCodes;

// returns possible region codes for provided prefix
-(NSArray *)getCountrySuffixForPrefix:(id)prefix;
@end
