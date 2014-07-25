//
//  TKActivityMaps.m
//  EMTE
//
//  Created by Taras Kalapun on 05/06/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "TKActivityMaps.h"
#import <MapKit/MapKit.h>

@interface TKActivityMaps ()

@end

@implementation TKActivityMaps


- (NSString *)activityType
{
    return NSStringFromClass(self.class);
}

- (NSString *)activityTitle
{
    return NSLocalizedString(@"Maps", nil);
    //return NSLocalizedStringFromTable(@"activity.openMaps", @"CCHMapsActivity", nil);
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"TKActivityMaps.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    if (self.mapItem) {
        return YES;
    }
    
    if (self.addressLine) {
        return YES;
    }
    
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:MKMapItem.class]) {
            return YES;
        }
        else if ([activityItem isKindOfClass:NSString.class]) {
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:MKMapItem.class]) {
            self.mapItem = activityItem;
            break;
        }
        else if ([activityItem isKindOfClass:NSString.class]) {
            self.addressLine = activityItem;
        }
    }
}

- (void)performActivity
{
    if (self.mapItem) {
        BOOL result = [self.mapItem openInMapsWithLaunchOptions:self.launchOptions];
        [self activityDidFinish:result];
    } else if (self.addressLine) {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:self.addressLine
                     completionHandler:^(NSArray *placemarks, NSError *error) {
                         
                         if (error) {
                             // error
                             [self activityDidFinish:YES];
                             return;
                         }
                         
                         // Convert the CLPlacemark to an MKPlacemark
                         // Note: There's no error checking for a failed geocode
                         CLPlacemark *geocodedPlacemark = placemarks[0];
                         MKPlacemark *placemark = [[MKPlacemark alloc]
                                                   initWithCoordinate:geocodedPlacemark.location.coordinate
                                                   addressDictionary:geocodedPlacemark.addressDictionary];
                         
                         // Create a map item for the geocoded address to pass to Maps app
                         MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
                         [mapItem setName:geocodedPlacemark.name];
                         
                         BOOL result = [mapItem openInMapsWithLaunchOptions:self.launchOptions];
                         [self activityDidFinish:result];
                         
                     }];
    }
}

@end
