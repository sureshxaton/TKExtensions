//
//  MKMapSnapshotter+TKE
//  EMTE
//
//  Created by Taras Kalapun on 24/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "MKMapSnapshotter+TKE.h"


@implementation MKMapSnapshotter (TKE)

+ (void)snapshotImageWithCoordinate:(CLLocationCoordinate2D)coordinate size:(CGSize)size handler:(MKMapSnapshotImageCompletionHandler)handler
{
    CLLocationDistance d = 80;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, d, d);
    [self snapshotImageWithRegion:region size:size handler:handler];
}

+ (void)snapshotImageWithRegion:(MKCoordinateRegion)region size:(CGSize)size handler:(MKMapSnapshotImageCompletionHandler)handler
{
    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
    options.region = region;
    options.size = size;
    //options.scale = [UIScreen mainScreen].scale;
    
    MKMapSnapshotter *snapshotter = [[MKMapSnapshotter alloc] initWithOptions:options];
    [snapshotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *error) {
        if (error) {
            handler(nil, error);
            return;
        }
        
        MKAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:nil];
        UIImage *image = snapshot.image;
        
        UIGraphicsBeginImageContextWithOptions(image.size, YES, image.scale);
        {
            [image drawAtPoint:CGPointMake(0.0f, 0.0f)];
            [pin.image drawAtPoint:[snapshot pointForCoordinate:region.center]];
        }
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        
        handler(image, error);
        //NSData *data = UIImagePNGRepresentation(image);
        //[data writeToFile:[self snapshotFilename] atomically:YES];
    }];
}

+ (void)snapshotImageWithAddressString:(NSString *)address size:(CGSize)size handler:(MKMapSnapshotImageCompletionHandler)handler
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        if([placemarks count]) {
            CLPlacemark *placemark = placemarks[0];
            CLLocation *location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
            [self snapshotImageWithCoordinate:coordinate size:size handler:handler];
        } else {
            handler(nil, error);
        }
    }];
}


@end
