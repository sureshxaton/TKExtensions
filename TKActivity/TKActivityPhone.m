//
//  TKActivityPhone.m
//  EMTE
//
//  Created by Taras Kalapun on 05/06/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "TKActivityPhone.h"

@implementation TKActivityPhone

- (NSString *)activityType
{
    return NSStringFromClass(self.class);
}

- (NSString *)activityTitle
{
    return NSLocalizedString(@"Call", nil);
    //return NSLocalizedStringFromTable(@"activity.openMaps", @"CCHMapsActivity", nil);
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"TKActivityPhone.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    if (self.phoneNumber.length > 0) {
        return YES;
    }
    
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:NSString.class]) {
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:NSString.class]) {
            self.phoneNumber = activityItem;
            break;
        }
    }
}

- (void)performActivity
{
    NSURL *url = [NSURL URLWithString:[@"tel://" stringByAppendingString:self.phoneNumber]];
    BOOL result = [[UIApplication sharedApplication] openURL:url];
    [self activityDidFinish:result];
}
@end
