#import "SVProgressHUD+TKE.h"

#ifdef COCOAPODS_POD_AVAILABLE_SVProgressHUD
@implementation SVProgressHUD (TKE)

+ (void)showBlocking
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
}

static NSString *currentDisplayedError = nil;
+ (void)showError:(NSError *)error
{
    NSString *errorDescription = (error) ? [error localizedDescription] : nil;
    if (error.code != NSURLErrorCancelled) {
            [SVProgressHUD showErrorWithStatus:errorDescription];
    }
    else {
        [SVProgressHUD dismiss];
    }
}

+ (void)dismissWithPossibleMessage:(id)responce
{
    if ([responce isKindOfClass:[NSDictionary class]]) {
        if (responce[@"message"]) {
            if (responce[@"status"] && [responce[@"status"] intValue] == 200) {
                [SVProgressHUD showSuccessWithStatus:responce[@"message"]];
            } else if (responce[@"statusCode"] && [responce[@"statusCode"] intValue] == 200) {
                [SVProgressHUD showSuccessWithStatus:responce[@"message"]];
            } else {
                [SVProgressHUD showImage:nil status:responce[@"message"]];
            }
            
            return;
        }
    }
    [SVProgressHUD dismiss];
}

+ (void)showAlertError:(NSError *)error
{
    
    NSString *errorDescription = nil;
    if ([errorDescription length] > 0 && ![errorDescription isEqualToString:currentDisplayedError]) {
        currentDisplayedError = errorDescription;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:errorDescription delegate:self cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:nil];
        [alert show];
    }
    [SVProgressHUD dismiss];
}

+ (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    currentDisplayedError = nil;
}
#endif

@end
