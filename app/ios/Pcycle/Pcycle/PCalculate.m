//
//  PCalculate.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-3.
//  Copyright (c) 2014年 Shun. All rights reserved.
//
#import "PCalculate.h"

@implementation PCalculate

-(float) CalculateFrontalArea_Height:(float)height Weight:(float)weight
{
    return 0.144 + 0.2 *(0.0061*height + 0.0128*weight - 0.1529);
}

-(float) CalculatePower_Weight : (float) m Velocity1 : (float) V1 Velocity2 : (float) V2 Height : (float) h Distance : (float) Sd FrontalArea : (float) Sf
{
    float M = m + 12;
    float Wd = 0.5*M*V2*V2 - 0.5*M*V1*V1;
    
    float Wh = M*9.8*h;
    float Wi = 0.0058*M*9.8*Sd;
    float Wr = 0.5*0.5*1.2*V2*V2*sqrt(Sd*Sd + fabs(h)*fabs(h))*Sf;
    
    return Wd + Wh + Wi + Wr;
}

-(float) TranslateJouleToKCalorie: (float) joule
{
    return joule/ConstJouleToKCalorie;
}

@end

