//
//  NSObject+TKE.m
//  EMTE
//
//  Created by Taras Kalapun on 28/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "NSObject+TKE.h"
#import <objc/runtime.h>

static const char *identifierKey = "tke.identifier";

@implementation NSObject (TKE)

@dynamic identifierKey;

- (NSString *)identifierKey {
    id identifier = objc_getAssociatedObject(self, &identifierKey);
    return identifier;
}
- (void)setIdentifierKey:(NSString *)identifier {
    objc_setAssociatedObject(self, &identifierKey, identifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
