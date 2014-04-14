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
    
       //设置背景图片
    UIImageView *backGroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SLIDING_LEFT_PANEL_BACKGROUND_IMAGE]];
    backGroundView.frame = self.view.bounds;
    backGroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view insertSubview:backGroundView atIndex:0];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

@end