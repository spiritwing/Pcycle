//
//  PcycleSlidingCenterPanelTitleController.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-24.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "PcycleSlidingCenterPanelTitleController.h"

@interface PcycleSlidingCenterPanelTitleController ()

@end

@implementation PcycleSlidingCenterPanelTitleController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initCenterPanelTitleController];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void) initCenterPanelTitleController
{
    [self initTitleBackground];
    
    [self initTitleImage];
    
    [self initButtons];
    
}

-(void) initTitleBackground
{
    
}

-(void) initTitleImage
{
    self._pcycleTitle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SLIDING_CENTER_PANEL_TITLE_IMAGE]];
    self._pcycleTitle.frame = SLIDING_CENTER_PANEL_TITLE_IMAGE_FRAME;
    [self.view insertSubview:self._pcycleTitle atIndex:1];
}

-(void) initButtons
{
    [self._moreServiceButton setBackgroundImage:[UIImage imageNamed:SLIDING_CENTER_PANEL_MORE_SERVICE_IMAGE] forState:UIControlStateNormal];
    self._moreServiceButton.frame = SLIDING_CENTER_PANEL_MORE_SERVICE_FRAME;
    self._moreServiceButton.transform = CGAffineTransformMakeScale(1, 1);
    
    [self._synchronizationButton setBackgroundImage:[UIImage imageNamed:SLIDING_CENTER_PANEL_SYNCHRONIZATION_IMAGE] forState:UIControlStateNormal];
    self._synchronizationButton.frame = SLIDING_CENTER_PANEL_SYNCHRONIZATION_FRAME;
    self._moreServiceButton.transform = CGAffineTransformMakeScale(1, 1);
    
}
@end
