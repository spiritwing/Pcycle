//
//  CyclingData.m
//  Pcycle
//骑行中得数据（一秒一组）
//  Created by 郝 源顺 on 14-3-14.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "CyclingData.h"

@implementation CyclingData 

@synthesize _speed;
@synthesize _power;
@synthesize _timeStamp;
@synthesize _longitude;
@synthesize _latitude;
@synthesize _altitude;
@synthesize _climbHeight;
@synthesize _distance;
@synthesize _gradient;
//@synthesize _uploadOrNot;

-(id) initCyclingDataSpeed : (float) speed
                     Power : (float) power
                 TimeStamp : (TIME_STAMP_TYPE) timeStamp
                 Longitude : (float) longitude
                  Latitude : (float) latitude
                  Altitude : (float) altitude
               ClimbHeight : (float) climbHeight
                  Distance : (float) distance
                  Gradient : (float) gradient

{
    if(self = [super init])
    {
        self._speed = speed;
        self._power = power;
        self._timeStamp = timeStamp;
        self._longitude = longitude;
        self._latitude = latitude;
        self._altitude = altitude;
        self._climbHeight = climbHeight;
        self._distance = distance;
        self._gradient = gradient;
        //self._uploadOrNot = uploadOrNot;
    }
    return self;
}




@end





