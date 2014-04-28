//
//  SlidingCenterViewController.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-23.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "SlidingCenterViewController.h"

@interface SlidingCenterViewController ()
@property (nonatomic, weak) AppDelegate* appDelegate;
@end

@implementation SlidingCenterViewController
NSThread *persistThread;
NSThread *timerThread;
@synthesize count;
- (id)init {
    if (self = [super init]) {

        NSLog(@"Center Panel\n");
 
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    
    [self initSeparatorImage];
    [self initCentralCircle];
    [self initLabels];
    [self initStartButton];
    
 
    
    
}


#pragma mark --------------- InitViews ---------------

-(void) initSeparatorImage
{
    self._separatorImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SLIDING_CENTER_PANEL_SEPARATOR_IMAGE]];
    self._separatorImage.frame = SLIDING_CENTER_PANEL_SEPARATOR_FRAME;
    [self.view insertSubview:self._separatorImage atIndex:1];
}

-(void) initCentralCircle
{
    self._centralCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SLIDING_CENTER_PANEL_CENTRAL_CIRCLE_IMAGE]];
    self._centralCircle.frame = SLIDING_CENTER_PANEL_CENTRAL_CIRCLE_FRAME;
    [self.view insertSubview:self._centralCircle atIndex:1];
}

-(void) initStartButton
{
    self.startButtonFlag = 0;
    [self._startButton setBackgroundImage:[UIImage imageNamed:SLIDING_CENTER_PANEL_START_IMAGE] forState:UIControlStateNormal];
    self._startButton.frame = SLIDING_CENTER_PANEL_START_FRAME;
    self._startButton.transform = CGAffineTransformMakeScale(1, 1);
}

-(void) initLabels
{
    self._accelerationLabel = [[UILabel alloc] initWithFrame:SLIDING_CENTER_PANEL_ACCELERATION_FRAME];
    //self._accelerationLabel.frame = SLIDING_CENTER_PANEL_ACCELERATION_FRAME;
    self._accelerationLabel.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *accelerationStr = [[NSMutableAttributedString alloc] initWithString:@"0-30km/s acceleration 0 sec"];
    [accelerationStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,8)];
    [accelerationStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(9,12)];
    [accelerationStr addAttribute:NSForegroundColorAttributeName value:[[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f] range:NSMakeRange(22,1)];
    [accelerationStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(24,3)];
    self._accelerationLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_PANEL_FONT_GENERAL_SIZE];
    self._accelerationLabel.attributedText = accelerationStr;
    [self.view addSubview:self._accelerationLabel];
    
    self._statementLabel = [[UILabel alloc] initWithFrame:SLIDING_CENTER_PANEL_STATEMENT_FRAME];
    //self._accelerationLabel.frame = SLIDING_CENTER_PANEL_STATEMENT_FRAME;
    self._statementLabel.textAlignment = NSTextAlignmentCenter;
    self._statementLabel.text = SLIDING_CENTER_PANEL_PRESS_START;
    self._statementLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_PANEL_FONT_GENERAL_SIZE];
    [self.view addSubview:self._statementLabel];
    
    self._staminaLabel = [[UILabel alloc] initWithFrame:SLIDING_CENTER_PANEL_STAMINAL_FRAME];
    self._staminaLabel.textAlignment = NSTextAlignmentCenter;
    self._staminaLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_PANEL_FONT_STAMINAL_SIZE];
    self._staminaLabel.textColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f] ;
    self._staminaLabel.text = SLIDING_CENTER_PANEL_DEFAULT_STAMINAL;
    [self.view addSubview:self._staminaLabel];
    
    self.speedLabel = [[UILabel alloc] initWithFrame: CGRectMake(40,380,80,20)];
    self.speedLabel.textAlignment = NSTextAlignmentLeft;
    self.speedLabel.font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_PANEL_FONT_GENERAL_SIZE];
    self.speedLabel.textColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f] ;
    //self.speedLabel.text = SLIDING_CENTER_PANEL_DEFAULT_STAMINAL;
    [self.view addSubview:self.speedLabel];
    
    self.powerLabel = [[UILabel alloc] initWithFrame: CGRectMake(200,380,80,20)];
    self.powerLabel .textAlignment = NSTextAlignmentLeft;
    self.powerLabel .font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_PANEL_FONT_GENERAL_SIZE];
    self.powerLabel .textColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f] ;
    //self.speedLabel.text = SLIDING_CENTER_PANEL_DEFAULT_STAMINAL;
    [self.view addSubview:self.powerLabel ];

    self.mileageLabel = [[UILabel alloc] initWithFrame: CGRectMake(40,420,80,20)];
    self.mileageLabel .textAlignment = NSTextAlignmentLeft;
    self.mileageLabel .font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_PANEL_FONT_GENERAL_SIZE];
    self.mileageLabel .textColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f] ;
    //self.speedLabel.text = SLIDING_CENTER_PANEL_DEFAULT_STAMINAL;
    [self.view addSubview:self.mileageLabel];

    self.timeLabel = [[UILabel alloc] initWithFrame: CGRectMake(200,420,200,20)];
    self.timeLabel .textAlignment = NSTextAlignmentLeft;
    self.timeLabel .font = [UIFont fontWithName:SLIDING_PANEL_FONT size:SLIDING_PANEL_FONT_GENERAL_SIZE];
    self.timeLabel .textColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f] ;
    //self.speedLabel.text = SLIDING_CENTER_PANEL_DEFAULT_STAMINAL;
    [self.view addSubview:self.timeLabel];

    
    
}

-(void) setStartButtonImage
{
    if (self.startButtonFlag == 0) {
         [self._startButton setBackgroundImage:[UIImage imageNamed:SLIDING_CENTER_PANEL_START_IMAGE] forState:UIControlStateNormal];
    }
    else if(self.startButtonFlag == 1)
    {
         [self._startButton setBackgroundImage:[UIImage imageNamed:SLIDING_CENTER_PANEL_STOP_IMAGE] forState:UIControlStateNormal];
    }
}

#pragma mark --------------- EventHandles ---------------

-(IBAction)btnStartButton:(id)sender
{
    //[self saveData];
    if(self.startButtonFlag == 0)
    {
        self.aPcyclingDataSet = [[NSMutableOrderedSet alloc] init];
        self.bPcyclingDataSet = [[NSMutableOrderedSet alloc] init];
        self.setFlag = 1;
        self.startButtonFlag = 1;
        [self setStartButtonImage];
        [self StartGPSLocation];
        //[self startTimer];
        
    }
    else if(self.startButtonFlag == 1)
    {
        self.startButtonFlag = 0;
        [self setStartButtonImage];
        [self StopGPSLocation];
    }
    
}

-(void)startTimerThread
{
    timerThread = [[NSThread alloc] initWithTarget:self selector:@selector(startTimer) object:nil];
    
    [timerThread start];
    
    //[NSThread sleepForTimeInterval:0.001]
    
}

-(void) startTimer
{
    [NSThread sleepForTimeInterval:1];
    @autoreleasepool
    {
        [NSTimer scheduledTimerWithTimeInterval:0.01
                                         target:self
                                       selector:@selector(updateTime:)
                                       userInfo:nil
                                        repeats:YES];
        [[NSRunLoop currentRunLoop] run];
        
    }
}

-(void) updateTime :(NSTimer *) timer
{
    if(timerThread.isCancelled)
    {
        [timer invalidate];
        return;
    }
    else
    {
        self.cycleTime += 0.01;
        self.timeStr = [NSString stringWithFormat:@"%02d : %02d : %05.2f",(int)self.cycleTime/3600, (int)((int) (self.cycleTime)/60) , (self.cycleTime - ((int)self.cycleTime/60)*60) ];
        [self performSelectorOnMainThread:@selector(updateTimeLabel)withObject:self.timeStr waitUntilDone:YES];
    }
}

-(void) updateTimeLabel
{
    self.timeLabel.text = self.timeStr;
}
-(void) saveData
{
    NSError *error;
    
    for(int i = 0 ; i<LOOPTIME ;++i)
    {
        PUser *temp = [NSEntityDescription insertNewObjectForEntityForName:@"PUser" inManagedObjectContext:self.appDelegate.managedObjectContext];
        
        temp.userID = [NSString stringWithFormat:@"%9d",i];
        temp.userName = [NSString stringWithFormat:@"haoshun%d",i];
        temp.userPhoneNumber = [NSString stringWithFormat:@"1868242366%d" , i];
        temp.userWeight = 75.0 +i;
        temp.userHeight = 180;
        temp.userAge = 25;
        temp.userMaxStamina = 3456+i;
        temp.userMaxStaminaTimeStamp = [self convertDateToLocalTime:[NSDate date]];
        temp.userLastStamina = 3256+i;
        temp.userTotalMileage = 2456.4 +i;
        temp.userFrontalArea = 1.223 + i/10.0;
        temp.userMaxSpeed = 60.1+i;
        temp.userMaxSpeedTimeStamp = [[NSDate alloc] initWithTimeIntervalSince1970:1386298334];
        temp.userMaxPower = 1234.5+i;
        temp.userMaxPowerTimeStamp = [[NSDate alloc] initWithTimeIntervalSinceNow:-3*3600*24];
        
        
    }
    
    for(int i = 0 ; i<LOOPTIME ;++i)
    {
        PCyclingData *temp = [NSEntityDescription insertNewObjectForEntityForName:@"PCyclingData" inManagedObjectContext:self.appDelegate.managedObjectContext];
        
        temp.speed = 30.0 +i;
        temp.power = 350.3+10*i;
        temp.timeStamp = [self convertDateToLocalTime:[NSDate date]];
        temp.longitude = 134.232424 + i;
        temp.latitude = 23.234213;
        temp.altitude = 200.21312;
        temp.climbHeight = 0.254;
        temp.distance = 10.2+i;
        temp.gradient = 12.32+i;
        
    }

    for(int i = 0 ; i<LOOPTIME ;++i)
    {
        PCycleRecord *temp = [NSEntityDescription insertNewObjectForEntityForName:@"PCycleRecord" inManagedObjectContext:self.appDelegate.managedObjectContext];
        
        temp.userID = [NSString stringWithFormat:@"%9d",i];
        temp.userCyclingTime = [NSNumber numberWithInt:8764];
        temp.userCyclingTimeStamp = [self convertDateToLocalTime:[NSDate date]];
        temp.userCyclingMileage = [NSNumber numberWithFloat:50.123f];
        temp.userCyclingStamina = [NSNumber numberWithInt:2456];
        temp.userClimbHeight = [NSNumber numberWithFloat:34.56f];
        temp.userCalorie = [NSNumber numberWithFloat:2685.5];
        temp.userEnergy = [NSNumber numberWithDouble:34353.2];
        temp.userCyclingAverageSpeed = [NSNumber numberWithFloat:45.3];
        temp.userCyclingMaxSpeed = [NSNumber numberWithFloat:34.7];
        temp.userCyclingAveragePower = [NSNumber numberWithFloat:600.1];
        temp.userCyclingMaxPower = [NSNumber numberWithFloat:380.4];
        temp.isUploaded = YES;
        
    }
    if([self.appDelegate.managedObjectContext save:&error])
    {
        
    }
    else
    {
        NSLog(@"save wrong : %@ %@ \n" , error , [error userInfo]);
    }

}

-(NSDate *)convertDateToLocalTime:(NSDate *) Date
{
    NSTimeZone *nowTimeZone = [NSTimeZone localTimeZone];
    NSInteger timeOffset = [nowTimeZone secondsFromGMTForDate:Date];
    NSDate *newDate = [Date dateByAddingTimeInterval:timeOffset];
    return newDate;
}

#pragma mark --------------- MultiThreading ---------------


-(void)PersistenceThread
{
    persistThread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    [persistThread start];
    
    //[NSThread sleepForTimeInterval:0.001]
    
}

-(void) run
{
    NSLog(@"-----%@----" , [NSThread currentThread].name);
    [NSThread sleepForTimeInterval:2];
    @autoreleasepool
    {
        [NSTimer scheduledTimerWithTimeInterval:5.0
                                     target:self
                                   selector:@selector(PersistData:)
                                   userInfo:nil
                                    repeats:YES];
        [[NSRunLoop currentRunLoop] run];

    }
}

-(void) PersistData:(NSTimer*) timer
{
    if (persistThread.isCancelled)
    {
        if (self.aPcyclingDataSet.count != 0)
        {
            for (int i = 0 ; i<self.aPcyclingDataSet.count; ++i)
            {
                PCyclingData *temp = [NSEntityDescription insertNewObjectForEntityForName:@"PCyclingData" inManagedObjectContext:self.appDelegate.managedObjectContext];
                [self GetDataFormNSDictionary:[self.aPcyclingDataSet objectAtIndex:i] ToPcyclingDataEntity:temp];
                NSLog(@"Persist ---------------------------%f" , temp.power);
                NSLog(@"Persist ---------------------------%i" , self.setFlag);
                
            }
        }
        
        if (self.bPcyclingDataSet.count != 0)
        {
            for (int i = 0 ; i<self.bPcyclingDataSet.count; ++i)
            {
                PCyclingData *temp = [NSEntityDescription insertNewObjectForEntityForName:@"PCyclingData" inManagedObjectContext:self.appDelegate.managedObjectContext];
                [self GetDataFormNSDictionary:[self.bPcyclingDataSet objectAtIndex:i] ToPcyclingDataEntity:temp];
                NSLog(@"Persist ---------------------------%f" , temp.power);
                NSLog(@"Persist ---------------------------%i" , self.setFlag);
                
            }
        }
        
        [self PersistPCycleRecordData];
        
        NSError *error;
        if([self.appDelegate.managedObjectContext save:&error])
        {
            
        }
        else
        {
            NSLog(@"save wrong : %@ %@ \n" , error , [error userInfo]);
        }
        
        [NSThread exit];
    }
    else
    {
        if ([self PersistSwitchSet].count != 0)
        {

        for (int i = 0; i<[self PersistSwitchSet].count; ++i)
        {
            PCyclingData *temp = [NSEntityDescription insertNewObjectForEntityForName:@"PCyclingData" inManagedObjectContext:self.appDelegate.managedObjectContext];
            
            [self GetDataFormNSDictionary:[[self PersistSwitchSet] objectAtIndex:i] ToPcyclingDataEntity:temp];
            NSLog(@"Persist ---------------------------%f" , temp.power);
            NSLog(@"Persist ---------------------------%i" , self.setFlag);
            
        }
    
        [[self PersistSwitchSet] removeAllObjects];
    }
    }
    NSError *error;
    if([self.appDelegate.managedObjectContext save:&error])
    {
        
    }
    else
    {
        NSLog(@"save wrong : %@ %@ \n" , error , [error userInfo]);
    }

    //[timer invalidate];
}

-(void) PersistPCycleRecordData
{
    PCycleRecord *temp = [NSEntityDescription insertNewObjectForEntityForName:@"PCycleRecord" inManagedObjectContext:self.appDelegate.managedObjectContext];
    
    temp.userID = [NSString stringWithFormat:@"haoshun1990"];
    temp.userCyclingTime =[NSNumber numberWithInt:(int) self.sumTime];
    NSLog(@"T: %@" , self.startCycleTime);
    temp.userCyclingTimeStamp = self.startCycleTime;
    temp.userCyclingMileage = [NSNumber numberWithFloat:self.sumDistance];
    temp.userCyclingStamina = [NSNumber numberWithInt:2456];
    temp.userClimbHeight = [NSNumber numberWithFloat: self.sumClimb];
    temp.userCalorie = [NSNumber numberWithFloat: [self.calculate TranslateJouleToKCalorie:self.sumPower]];
    NSLog(@"Calorie:-----------------------%f" , [self.calculate TranslateJouleToKCalorie:self.sumPower]);
    temp.userEnergy = [NSNumber numberWithDouble:34353.2];
    temp.userCyclingAverageSpeed = [NSNumber numberWithFloat:(self.sumDistance/self.sumTime)*3.6];
    NSLog(@"MaxSpeed:-----------------------%f" , self.maxSpeed);
    temp.userCyclingMaxSpeed = [NSNumber numberWithFloat:self.maxSpeed];
    temp.userCyclingAveragePower = [NSNumber numberWithFloat:self.sumPower/self.sumTime];
    NSLog(@"SumPower:-------------------------%f" , self.sumPower);
    NSLog(@"SumTime:-------------------------%f" , self.sumTime);
    NSLog(@"SumDistance:-------------------------%f" , self.sumDistance);
    NSLog(@"MaxAveragePower:-----------------------%f" , self.sumPower/self.sumTime);
    temp.userCyclingMaxPower = [NSNumber numberWithFloat:self.maxPower];
    temp.isUploaded = NO;
    
    
}

-(void) GetDataFormNSDictionary: (NSDictionary * ) dic ToPcyclingDataEntity: (PCyclingData *) temp
{
    temp.speed = [[dic objectForKey:@"speed"] floatValue];
    temp.power = [[dic objectForKey:@"power"] floatValue];
    temp.timeStamp = [dic objectForKey:@"timeStamp"];
    temp.longitude = [[dic objectForKey:@"longitude"] doubleValue];
    temp.latitude = [[dic objectForKey:@"latitude"] doubleValue];
    temp.altitude = [[dic objectForKey:@"altitude"] floatValue];
    temp.climbHeight = [[dic objectForKey:@"climbHeight"] floatValue];
    temp.distance = [[dic objectForKey:@"distance"] floatValue];
    temp.gradient = [[dic objectForKey:@"gradient"] floatValue];
}


#pragma mark --------------- GPSLocation ---------------

-(void) StartGPSLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.calculate = [[PCalculate alloc] init];
    
    
    if([CLLocationManager locationServicesEnabled])
	{
		NSLog( @"开始执行定位服务" );
       
		// 设置定位精度：最佳精度
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
		// 设置距离过滤器
		self.locationManager.distanceFilter = kCLDistanceFilterNone;
		// 将视图控制器自身设置为CLLocationManager的delegate
		// 因此该视图控制器需要实现CLLocationManagerDelegate协议
		self.locationManager.delegate = self;
		// 开始监听定位信息
		[self.locationManager startUpdatingLocation];
        
        self.startCycleTime = [self convertDateToLocalTime:[NSDate date]];
        self.staminaQueue = [[PcycleQueue alloc] init];
        NSLog(@"T1: %@" , self.startCycleTime);
        [self PersistenceThread];
        [self startTimerThread];
	}
	else
	{
		NSLog( @"无法使用定位服务！" );
	}
}

-(void) StopGPSLocation
{
    [self.locationManager stopUpdatingLocation];
    [persistThread cancel];
    [timerThread cancel];
    NSLog(@"%d" , self.staminaQueue.GetQueueLength);
    [self.staminaQueue ShowAll];
    [self.staminaQueue ClearQueue];
    NSLog(@"%d" , self.staminaQueue.GetQueueLength);
}

-(void)locationManager:(CLLocationManager *)manager
	didUpdateLocations:(NSArray *)locations
{
	// 获取最后一个定位数据
	CLLocation* newLocation = [locations lastObject];
    if (self.prevLocation)
    {
        // 计算本次定位数据与上次定位数据之间的时间差
        NSTimeInterval dTime = [newLocation.timestamp
                                timeIntervalSinceDate:self.prevLocation.timestamp];
        self.sumTime += dTime;
        
        //NSLog(@"totalTime:   %f" , self.sumTime);
        
        CGFloat distance = [newLocation
                            distanceFromLocation:self.prevLocation];
        
        self.sumDistance += distance;
        
        CGFloat climbHeight = newLocation.altitude-self.prevLocation.altitude;
        
        if (climbHeight < 0)
        {
            climbHeight = 0;
        }
        
        self.sumClimb += climbHeight;
        
        //NSLog(@"SumDistance:-----------------%f" , self.sumDistance);
        
        float FrontArea = [self.calculate CalculateFrontalArea_Height:185.0 Weight:66];
        
        NSLog(@"%f  %f %f %f " , self.prevLocation.speed , newLocation.speed , (newLocation.altitude-self.prevLocation.altitude), distance);
        
        float Power = [self.calculate CalculatePower_Weight:85.0f Velocity1:self.prevLocation.speed Velocity2:newLocation.speed Height:(newLocation.altitude-self.prevLocation.altitude) Distance:distance FrontalArea:FrontArea];
        
        if (Power < 0) {
            Power = 0;
        }
        
        NSLog(@"Power  %f" , Power);
        self.sumPower += Power;
        //NSLog(@"SumPower:-----------------%f" , self.sumPower);

        if (Power > self.maxPower) {
            self.maxPower = Power;
            NSLog(@"MAXPower  %f" , self.maxPower);
           // NSLog(@"MAXPower  %f" , [[NSString stringWithFormat:@"%.1f" , self.maxPower] floatValue]);
           // NSLog(@"MAXPower  %i" , (int)self.maxPower);
            //self._staminaLabel.text = [NSString stringWithFormat:@"%i" , (int)self.maxPower *10];
        }
        NSNumber * headStamina = [NSNumber alloc];
        
        if (self.staminaCount < STAMINA_TEST_TIME)
        {
            if (![self.staminaQueue EntryQueueRear:[NSNumber numberWithFloat:Power]])
            {
                NSLog(@"Queue Entry Wrong");
            }
            self.sumStamina += Power;
        }
        else
        {
            headStamina = self.staminaQueue.GetQueueHead ;
            
            if (![self.staminaQueue EntryQueueRear:[NSNumber numberWithFloat:Power]])
            {
                NSLog(@"Queue Entry Wrong");
            }
            self.sumStamina = self.sumStamina + Power - [headStamina floatValue];
        }
        
        NSLog(@"sumStamina:----------------- %f" ,  self.sumStamina);
        NSLog(@"StaminaQueue Count -------- %d" , self.staminaQueue.GetQueueLength);
        ++self.staminaCount;
        self._staminaLabel.text = [NSString stringWithFormat:@"%i" ,  (int) (self.sumStamina/STAMINA_TEST_TIME*10)];
        
        if(self.maxSpeed<self.prevLocation.speed)
        {
            self.maxSpeed = self.prevLocation.speed;
        }
        //NSLog(@"SumPower:-----------------%f", self.maxSpeed);
        self.speedLabel.text = [NSString stringWithFormat:@"%.2fkm/h" , newLocation.speed * 3.6];
        self.powerLabel.text = [NSString stringWithFormat:@"%.2f" , Power];
        self.mileageLabel.text = [NSString stringWithFormat:@"%.3fkm",self.sumDistance /1000];
        
        NSDictionary *tempDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithFloat:newLocation.speed] , @"speed",
                                 [NSNumber numberWithFloat:Power ], @"power" ,
                                 [self convertDateToLocalTime:[NSDate date]] , @"timeStamp",
                                 [NSNumber numberWithDouble : newLocation.coordinate.longitude] , @"longitude",
                                 [NSNumber numberWithDouble :newLocation.coordinate.latitude ], @"latitude" ,
                                 [NSNumber numberWithFloat:newLocation.altitude ], @"altitude" ,
                                 [NSNumber numberWithFloat:climbHeight ], @"climbHeight" ,
                                 [NSNumber numberWithFloat:distance] , @"distance" ,
                                 [NSNumber numberWithFloat:12.2 ], @"gradient" ,nil];
        
            [[self SwitchSet] addObject:tempDic];
        self.count++;
        
        if (self.count == 5)
        {
            if(self.setFlag == 1)
            {
                self.setFlag =2;
            }
            else
            {
                self.setFlag = 1;
            }
            self.count =0;
        }
        
    }
    self.prevLocation = newLocation;
    
}
// 定位失败时激发的方法
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
	NSLog(@"定位失败: %@",error);
}

-(NSMutableOrderedSet *) SwitchSet
{
    if (self.setFlag == 1)
    {
        return self.aPcyclingDataSet;
    }
    else
    {
        return self.bPcyclingDataSet;
    }
}

-(NSMutableOrderedSet *) PersistSwitchSet
{
    if (self.setFlag == 2)
    {
        return self.aPcyclingDataSet;
    }
    else
    {
        return self.bPcyclingDataSet;
    }
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
