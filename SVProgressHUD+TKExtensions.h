#ifdef COCOAPODS_POD_AVAILABLE_SVProgressHUD
#import "SVProgressHUD.h"
@interface SVProgressHUD (TKExtensions)
+ (void)showBlocking;
+ (void)showError:(NSError *)error;
+ (void)dismissWithPossibleMessage:(id)responce;
@end
#endif
