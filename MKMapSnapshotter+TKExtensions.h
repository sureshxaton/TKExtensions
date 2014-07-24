//
//  MKMapSnapshotter+TKExtensions.h
//  EMTE
//
//  Created by Taras Kalapun on 24/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import <MapKit/MapKit.h>

typedef void (^MKMapSnapshotImageCompletionHandler)(UIImage *image, NSError *error);

@interface MKMapSnapshotter (TKExtensions)
+ (void)snapshotImageWithCoordinate:(CLLocationCoordinate2D)coordinate size:(CGSize)size handler:(MKMapSnapshotImageCompletionHandler)handler;
+ (void)snapshotImageWithRegion:(MKCoordinateRegion)region size:(CGSize)size handler:(MKMapSnapshotImageCompletionHandler)handler;
+ (void)snapshotImageWithAddressString:(NSString *)address size:(CGSize)size handler:(MKMapSnapshotImageCompletionHandler)handler;
@end
