//
//  BDVCountryNameAndCode.h
//  BDVCountryNameAndCode
//
//  Created by Bas de Vries on 22-10-14.
//  Copyright (c) 2014 Bas de Vries. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDVCountryNameAndCode : NSObject

-(NSString *)prefixForCurrentLocale;
-(NSString *)countryNameForCurrentLocale;
-(UIImage *)countryFlagForCurrentLocale;

@end
