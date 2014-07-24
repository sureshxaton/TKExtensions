@interface UIStoryboard (TKExtensions)

+ (instancetype)universalStoryboardWithName:(NSString *)storyboardName;

+ (id)instantiateViewControllerWithIdentifier:(NSString *)identifier inStoryboardWithName:(NSString *)storyboardName;

@end
