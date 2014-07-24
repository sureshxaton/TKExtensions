@implementation UIStoryboard (TKExtensions)

+ (instancetype)universalStoryboardWithName:(NSString *)storyboardName {
    
    NSString *fileName = storyboardName;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        fileName = [fileName stringByAppendingString:@"~ipad"];
    } else {
        fileName = [fileName stringByAppendingString:@"~iphone"];
    }
    
    NSString *pathAndFileName = [[NSBundle mainBundle] pathForResource:fileName ofType:@"storyboard"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:pathAndFileName])
    {
        return [UIStoryboard storyboardWithName:fileName bundle:nil];
    }
    
    return [UIStoryboard storyboardWithName:storyboardName bundle:nil];
}

+ (id)instantiateViewControllerWithIdentifier:(NSString *)identifier inStoryboardWithName:(NSString *)storyboardName
{
    UIStoryboard *storyboard = [self universalStoryboardWithName:storyboardName];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}
@end
