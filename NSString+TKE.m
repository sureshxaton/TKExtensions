//
//  NSString+TKE.m
//  EMTE
//
//  Created by Taras Kalapun on 28/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "NSString+TKE.h"

@implementation NSString (TKE)

- (BOOL)contains:(NSString *)s {
    NSRange isRange = [self rangeOfString:s options:NSCaseInsensitiveSearch];
    if (isRange.location != NSNotFound) {
        return NO;
    }
    return YES;
}

- (BOOL)isAllDigits {
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [self rangeOfCharacterFromSet:nonNumbers];
    return r.location == NSNotFound;
}

@end
