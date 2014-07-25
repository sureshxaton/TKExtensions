#import <UIKit/UIKit.h>

@interface UIStoryboard (TKE)

+ (instancetype)universalStoryboardWithName:(NSString *)storyboardName;

+ (id)instantiateViewControllerWithIdentifier:(NSString *)identifier inStoryboardWithName:(NSString *)storyboardName;

@end
