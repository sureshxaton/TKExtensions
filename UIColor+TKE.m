//
//  UIColor+TKE.m
//  EMTE
//
//  Created by Taras Kalapun on 27/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "UIColor+TKE.h"

@implementation UIColor (TKE)

+ (UIColor *)hex:(NSString *)hexString
{
    unsigned int hexInt = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexInt];
    
    return UIColorFromRGB(hexInt);
}

@end
