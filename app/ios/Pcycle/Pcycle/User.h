//
//  User.h
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-12.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#ifndef Pcycle_User_h
#define Pcycle_User_h

//#import <Foundation/Foundation.h>
#import "AppDefaultAndConstValue.h"


@interface User : NSObject

@property (retain , nonatomic) NSString *_userName;
@property (retain , nonatomic) NSString *_userID;
@property (retain , nonatomic) NSString *_userPhoneNumber;
@property (nonatomic) float _userWeight;
@property (nonatomic) float _userHeight;
@property (nonatomic) int _userAge;
@property (nonatomic) int _userMaxStamina;
@property (retain , nonatomic) TIME_STAMP_TYPE _userMaxStaminaTimeStamp;
@property (nonatomic) int _userLastStamina;
@property ( nonatomic) double _userTotalMileage;
@property (nonatomic) float _userFrontalArea;
@property (nonatomic) float _userMaxSpeed;
@property (retain , nonatomic) TIME_STAMP_TYPE _userMaxSpeedTimeStamp;
@property (nonatomic) float _userMaxPower;
@property (retain , nonatomic) TIME_STAMP_TYPE _userMaxPowerTimeStamp;

-(id) initUserName :(NSString *) uN
            UserID : (NSString *) userID
            UserPN : (NSString *) userPhoneNumber
            UserW : (float) userWeight
            UserH : (float) userHeight
            UserA : (int) userAge
            UserMStamina : (int) userMaxStamina
            UserMStaminaTS : (TIME_STAMP_TYPE) userMaxStaminaTimeStamp
            UserLS : (int) userLastStamina
            UserTM : (double) userTotalMileage
            UserFA : (float) userFrontalArea
            UserMSpeed : (float) userMaxSpeed
            UserMSpeedTS : (TIME_STAMP_TYPE) userMaxSpeedTimeStamp
            UserMP : (float) userMaxPower
            UserMPTS : (TIME_STAMP_TYPE) userMaxPowerTimeStamp
;



@end

#endif
