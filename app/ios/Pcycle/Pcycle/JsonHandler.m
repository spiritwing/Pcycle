//
//  JsonAnalysisHandler.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-21.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "JsonHandler.h"

@interface JsonHandler ()

@end

@implementation JsonHandler

+ (NSDictionary *) AnalysisAppVersion:(NSData *)responseData
{
    NSError *error;
    
    NSDictionary *versionDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
    
    return versionDic;
}

+ (NSDictionary *) AnalysisUserLoginData : (NSData *) responseData
{
    NSError *error;
    
    NSDictionary *loginDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
    
    return loginDic;
}

+ (NSDictionary *) AnalysisUserRegisterData : (NSData *) responseData
{
    NSError *error;
    
    NSDictionary *registerDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
    
    return registerDic;
}

@end