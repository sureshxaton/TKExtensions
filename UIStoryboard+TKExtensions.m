@implementation UIStoryboard (TKExtensions)

+ (instancetype)universalStoryboardWithName:(NSString *)storyboardName {
    
    UIStoryboard *storyboard = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        storyboard = [UIStoryboard storyboardWithName:[storyboardName stringByAppendingString:@"~iPad"] bundle:nil];
    } else {
        storyboard = [UIStoryboard storyboardWithName:[storyboardName stringByAppendingString:@"~iPhone"] bundle:nil];
    }
    
    if (!storyboard) {
        storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    }
    return storyboard;
}

+ (id)instantiateViewControllerWithIdentifier:(NSString *)identifier inStoryboardWithName:(NSString *)storyboardName
{
    UIStoryboard *storyboard = [self universalStoryboardWithName:storyboardName];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}
@end
