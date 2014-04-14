//
//  UIViewController+SlidingPanel.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-20.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "UIViewController+SlidingPanel.h"

#import "SlidingPanelController.h"

@implementation UIViewController (SlidingPanel)

- (SlidingPanelController *)sidePanelController {
    UIViewController *iter = self.parentViewController;
    while (iter) {
        if ([iter isKindOfClass:[SlidingPanelController class]]) {
            return (SlidingPanelController *)iter;
        } else if (iter.parentViewController && iter.parentViewController != iter) {
            iter = iter.parentViewController;
        } else {
            iter = nil;
        }
    }
    return nil;
}

@end
