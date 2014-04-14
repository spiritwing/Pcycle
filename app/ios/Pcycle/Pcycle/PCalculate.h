//
//  PCalculate.h
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-3.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#ifndef Pcycle_PCalculate_h
#define Pcycle_PCalculate_h

#import <math.h>

@interface PCalculate : NSObject

-(float) CalculateFrontalArea_Height : (float) height Weight : (float) weight;

-(float) CalculatePower_Weight : (float) m Velocity1 : (float) V1 Velocity2 : (float) V2 Height : (float) h Distance : (float) Sd FrontalArea : (float) Sf;

@end

#endif
