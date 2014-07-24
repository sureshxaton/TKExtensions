#import "UIImage+QRCode.h"
#import <CoreImage/CoreImage.h>

@implementation UIImage (QRCode)

+ (instancetype)imageWithQRCode:(NSString *)code
{
    if (code.length == 0) return nil;
    
    NSData *data = [code dataUsingEncoding:NSUTF8StringEncoding];
    if (data.length == 0) return nil;
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    CIImage *outputImage = [filter outputImage];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage
                                       fromRect:[outputImage extent]];
    
    UIImage *image = [UIImage imageWithCGImage:cgImage
                                         scale:1.
                                   orientation:UIImageOrientationUp];
    
    // Resize without interpolating
    UIImage *resized = [self _resizeImage:image
                             withQuality:kCGInterpolationNone
                                    rate:6.0];
    
    CGImageRelease(cgImage);
    
    return resized;
}


+ (instancetype)_resizeImage:(UIImage *)image
             withQuality:(CGInterpolationQuality)quality
                    rate:(CGFloat)rate
{
	UIImage *resized = nil;
	CGFloat width = image.size.width * rate;
	CGFloat height = image.size.height * rate;
    
	UIGraphicsBeginImageContext(CGSizeMake(width, height));
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetInterpolationQuality(context, quality);
	[image drawInRect:CGRectMake(0, 0, width, height)];
	resized = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return resized;
}

@end
