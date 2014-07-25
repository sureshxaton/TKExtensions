#import "UIImageView+TKE.h"

static NSInteger kIndicatorTag = 1120;

@implementation UIImageView (TKE)

- (BOOL)showLoadingIndicator {
    UIActivityIndicatorView *indicator = (id)[self viewWithTag:kIndicatorTag];
    if (indicator && indicator.isAnimating) {
        return YES;
    }
    return NO;
}

- (void)setShowLoadingIndicator:(BOOL)showLoadingIndicator {
    UIActivityIndicatorView *indicator = (id)[self viewWithTag:kIndicatorTag];
    if (!indicator && showLoadingIndicator) {
        indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicator.tag = kIndicatorTag;
        CGRect frame = indicator.frame;
        frame.origin.x = (int)(self.frame.size.width - frame.size.width)/2;
        frame.origin.y = (int)(self.frame.size.height - frame.size.height)/2;
        indicator.frame = frame;
        indicator.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        indicator.hidesWhenStopped = YES;
        [self addSubview:indicator];
    }
    
    if (showLoadingIndicator) {
        [indicator startAnimating];
    } else {
        [indicator stopAnimating];
    }
    
}

@end
