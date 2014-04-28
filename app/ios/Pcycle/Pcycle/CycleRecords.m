//
//  CycleRecords.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-22.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "CycleRecords.h"

@implementation CycleRecords

@synthesize _userID;
@synthesize _userCyclingTime;
@synthesize _userCyclingTimeStamp;
@synthesize _userCyclingMileage;
@synthesize _userCyclingStamina;
@synthesize _userClimbHeight;
@synthesize _userCalorie;
@synthesize _userEnergy;
@synthesize _userCyclingAverageSpeed;
@synthesize _userCyclingMaxSpeed;
@synthesize _userCyclingAveragePower;
@synthesize _userCyclingMaxPower;
@synthesize _isUploaded;


-(id) initCycleRecordsUserID : (NSString*) userID
                      UserCT : (CYCLING_TIME) userCyclingTime
                     UserCTS : (TIME_STAMP_TYPE) userCyclingTimeStamp
                      UserCM : (float) userCyclingMileage
                      UserCS : (float) userCyclingStamina
                      UserCH : (float) userClimbHeight
                 UserCalorie : (float) userCalorie
                  UserEnergy : (double) userEnergy
                     UserCAS : (float) userCyclingAverageSpeed
                     UserCMS : (float) userCyclingMaxSpeed
                     UserCAP : (float) userCyclingAveragePower
                     UserCMP : (float) userCyclingMaxPower
                UserIsUpload : (BOOL) isUploaded
{
    if(self = [super init])
    {
        self._userID = userID;
        self._userCyclingTime = userCyclingTime;
        self._userCyclingTime = userCyclingTimeStamp;
        self._userCyclingMileage = userCyclingMileage;
        self._userCyclingStamina = userCyclingStamina;
        self._userClimbHeight = userClimbHeight;
        self._userCalorie = userCalorie;
        self._userEnergy = userEnergy;
        self._userCyclingAverageSpeed = userCyclingAverageSpeed;
        self._userCyclingMaxSpeed = userCyclingMaxSpeed;
        self._userCyclingAveragePower = userCyclingAveragePower;
        self._userCyclingMaxPower = userCyclingMaxPower;
        self._isUploaded = isUploaded;
    }
    
    return self;
}


@end