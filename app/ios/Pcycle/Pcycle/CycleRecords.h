//
//  CycleRecords.h
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-22.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#ifndef Pcycle_CycleRecords_h
#define Pcycle_CycleRecords_h

#import "AppDefaultAndConstValue.h"

@interface CycleRecords : NSObject

@property (retain , nonatomic) NSString *_userID;
@property (retain , nonatomic) CYCLING_TIME _userCyclingTime;
@property (retain , nonatomic) TIME_STAMP_TYPE _userCyclingTimeStamp;
@property ( nonatomic) float _userCyclingMileage;
@property ( nonatomic) float _userCyclingStamina;
@property (nonatomic) float _userClimbHeight;
@property (nonatomic) float _userCalorie;
@property (nonatomic) double _userEnergy;
@property (nonatomic) float _userCyclingAverageSpeed;
@property (nonatomic) float _userCyclingMaxSpeed;
@property (nonatomic) float _userCyclingAveragePower;
@property (nonatomic) float _userCyclingMaxPower;
@property (nonatomic) BOOL _isUploaded;


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
;



@end

#endif
