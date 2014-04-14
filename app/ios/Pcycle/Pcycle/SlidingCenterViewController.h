//
//  SlidingCenterViewController.h
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-23.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "AppDelegate.h"
#import "SlidingBaseViewController.h"
#import "AppDefaultAndConstValue.h"
#import "PUser.h"
#import "PCycleRecord.h"
#import "PCyclingData.h"
#import <CoreLocation/CoreLocation.h>
#import "PCalculate.h"
#define LOOPTIME 10

@interface SlidingCenterViewController : SlidingBaseViewController <CLLocationManagerDelegate>

@property (retain , nonatomic) IBOutlet UIImageView *_separatorImage;
@property (retain , nonatomic) IBOutlet UIButton *_startButton;
@property (retain , nonatomic) IBOutlet UIImageView *_centralCircle;
@property (retain , nonatomic) IBOutlet UILabel *_accelerationLabel;
@property (retain , nonatomic) IBOutlet UILabel *_statementLabel;
@property (retain , nonatomic) IBOutlet UILabel *_staminaLabel;
@property (retain , nonatomic) IBOutlet UILabel *speedLabel;
@property (retain , nonatomic) IBOutlet UILabel *powerLabel;
@property (retain , nonatomic) IBOutlet UILabel *mileageLabel;
@property (retain ,nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic , retain) CLLocationManager *locationManager;
@property (nonatomic , retain) CLLocation *prevLocation;
@property (nonatomic , assign) CGFloat sumDistance;
@property (nonatomic , assign) CGFloat sumTime;
@property (nonatomic , assign) CGFloat sumPower;
@property (nonatomic , retain) NSDate *startCycleTime;
@property (nonatomic , assign) float maxPower;
@property (nonatomic , assign) float maxSpeed;
@property (atomic, assign) int setFlag;

@property (atomic, assign) int startButtonFlag;
@property (atomic , assign) float cycleTime;
@property (atomic , retain) NSString *timeStr;
@property (atomic, assign) int count;
@property (nonatomic, retain) PCalculate *calculate;

@property (atomic , retain) NSMutableOrderedSet *aPcyclingDataSet;
@property (atomic , retain) NSMutableOrderedSet *bPcyclingDataSet;

-(void) initSeparatorImage;
-(void) initCentralCircle;
-(void) initStartButton;
-(void) initLabels;

-(void) StartGPSLocation;

-(void) StopGPSLocation;

-(IBAction) btnStartButton:(id)sender;


@end
