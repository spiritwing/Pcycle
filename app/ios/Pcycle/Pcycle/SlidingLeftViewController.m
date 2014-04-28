//
//  SlidingLeftViewController.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-23.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "SlidingLeftViewController.h"


@interface SlidingLeftViewController ()

@end

@implementation SlidingLeftViewController

- (id)init
{
    if (self = [super init]) {
        //self.title = @"Left Panel";
        NSLog(@"Left Panel\n");
        //[self.storyboard instantiateViewControllerWithIdentifier:@"pcycleCenterViewController"];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initBackgroundImage];
    [self initVersionLabel];
    [self initHeadPortraitImage];
    [self initUserNameLabel];
    [self initStaminaLabel];
    [self initSeparateLine];
    [self initFunctionButtons];
    [self initFunctionText];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


#pragma mark --------------- Init UI ---------------

- (void) initBackgroundImage
{
    //设置背景图片
    UIImageView *backGroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_BACKGROUND_IMAGE]];
    backGroundView.frame = self.view.bounds;
    backGroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //backGroundView.alpha = 0.5f;
    [self.view insertSubview:backGroundView atIndex:0];
    
    [self.blurImage setImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_BLUR_IMAGE]];
    [self.blurImage setAlpha:SLIDING_LEFT_PANEL_BLUR_IMAGE_ALPHA];

}

- (void) initVersionLabel
{
    self.versionLabel.textAlignment = NSTextAlignmentCenter;
    self.versionLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_VERSION_FONT_SIZE];
    self.versionLabel.textColor = [UIColor whiteColor];
    self.versionLabel.text = DEFAULT_VERSION;
}

- (void) initHeadPortraitImage
{
    [self.headPortraitImage setImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_HEAD_PORTRAIT_IMAGE]];
    
}

- (void) initSeparateLine
{
    [self.separateLine setImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_SEPARATE_LINE]];
}

- (void) initUserNameLabel
{
    self.userNameLabel.textAlignment = NSTextAlignmentCenter;
    self.userNameLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_USER_NAME_SIZE];
    self.userNameLabel.textColor = [UIColor whiteColor];
    self.userNameLabel.text = DEFAULT_USERNAME;
    //self.userNameLabel.backgroundColor = [UIColor redColor];
}

- (void) initStaminaLabel
{
    self.staminaLabel.textAlignment = NSTextAlignmentCenter;
    self.staminaLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_USER_STAMINA_SIZE];
    self.staminaLabel.textColor = [[UIColor alloc] initWithRed:SlidingPanelBlueR/255.0 green:SlidingPanelBlueG/255.0 blue:SlidingPanelBlueB/255.0 alpha:1.0f] ;
    self.staminaLabel.text = DEFAULT_STAMINA;
}

- (void) initFunctionButtons
{
    [self.indexButton setBackgroundImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_INDEX] forState:UIControlStateNormal];
    
    
    [self.journalButton setBackgroundImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_JOURNAL] forState:UIControlStateNormal];
    
    
    [self.leaderBoardButton setBackgroundImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_LEADERBOARD] forState:UIControlStateNormal];
    
    
    [self.profileButton setBackgroundImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_PROFILE] forState:UIControlStateNormal];
    
    
    [self.settingButton setBackgroundImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_SETTING] forState:UIControlStateNormal];
    
}

- (void) initFunctionText
{
    self.indexLabel.text = SLIDING_LEFT_PANEL_INDEX_TEXT;
    self.indexLabel.textColor = [UIColor whiteColor];
    self.indexLabel.textAlignment = NSTextAlignmentCenter;
    self.indexLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_LEFT_PANEL_FUNCTION_TEXT_FONE_SIZE];
    
    self.journalLabel.text = SLIDING_LEFT_PANEL_JOURNAL_TEXT;
    self.journalLabel.textColor = [UIColor whiteColor];
    self.journalLabel.textAlignment = NSTextAlignmentCenter;
    self.journalLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_LEFT_PANEL_FUNCTION_TEXT_FONE_SIZE];
    
    self.leaderBoradLabel.text = SLIDING_LEFT_PANEL_LEADERBOARD_TEXT;
    self.leaderBoradLabel.textColor = [UIColor whiteColor];
    self.leaderBoradLabel.textAlignment = NSTextAlignmentCenter;
    self.leaderBoradLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_LEFT_PANEL_FUNCTION_TEXT_FONE_SIZE];
    
    self.profileLabel.text = SLIDING_LEFT_PANEL_PROFILE_TEXT;
    self.profileLabel.textColor = [UIColor whiteColor];
    self.profileLabel.textAlignment = NSTextAlignmentCenter;
    self.profileLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_LEFT_PANEL_FUNCTION_TEXT_FONE_SIZE];
    
    self.settingLabel.text = SLIDING_LEFT_PANEL_SETTING_TEXT;
    self.settingLabel.textColor = [UIColor whiteColor];
    self.settingLabel.textAlignment = NSTextAlignmentCenter;
    self.settingLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_LEFT_PANEL_FUNCTION_TEXT_FONE_SIZE];
}


#pragma mark --------------- Screen ---------------

- (BOOL) shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)InterfaceOrientation {
    return (InterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}



@end