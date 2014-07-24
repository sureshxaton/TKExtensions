@implementation NSUserDefaults (KeyPath)
- (void)setBool:(BOOL)value forKeyPath:(NSString *)keyPath
{
    NSArray *components = [keyPath componentsSeparatedByString:@"."];
    if (components.count == 2) {
        NSString *key = components[0];
        NSString *key2 = components[1];
        
        NSMutableDictionary *d = [[self objectForKey:key] mutableCopy];
        if (!d) d = NSMutableDictionary.new;
        d[key2] = @(value);
        [self setObject:d forKey:key];
    } else {
        [self setBool:value forKey:keyPath];
    }
}
@end
