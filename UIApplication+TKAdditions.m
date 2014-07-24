@implementation UIApplication (TKAdditions)

+ (NSString *)versionString
{
    NSString *versionString;
    NSString *bundleShortVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSArray *versionCompontents = [bundleShortVersionString componentsSeparatedByString:@"."];
    if ([versionCompontents count] == 2) {
        float tmpVersion = [versionCompontents[1] intValue] / 10.0f;
        versionString = [NSString stringWithFormat:@"%@.%.1f", versionCompontents[0], tmpVersion];
    } else {
        versionString = bundleShortVersionString;
    }
    NSString *bundleVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    
	return [NSString stringWithFormat:@"%@ (%@)", versionString, bundleVersion];
    
}

@end
