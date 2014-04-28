//
//  PcycleSlidingPanelController.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-23.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "PcycleSlidingPanelController.h"


@interface PcycleSlidingPanelController ()


@end

@implementation PcycleSlidingPanelController

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

-(void) viewDidLoad
{
    [super viewDidLoad];

}

-(void) awakeFromNib
{
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"pcycleLeftViewController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"pcycleCenterViewController"]];
    [self setRightPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"pcycleRightViewController"]];
}

@end

