//
//  UserDefaultHandler.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-18.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "UserDefaultHandler.h"

@interface UserDefaultHandler ()

@end

@implementation UserDefaultHandler

+ (NSString *) getSessionId
{
    NSString * sesisonId = nil;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    sesisonId = [defaults objectForKey:USER_LOGIN_SESSIONID];
    
    return sesisonId;
}

+ (void) setSessionId:(NSString *)sessionId
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:sessionId forKey:USER_LOGIN_SESSIONID];
    
    [defaults synchronize];
}

+(NSString *) getAppVersion
{
    NSString * version = nil;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    version = [defaults objectForKey:APP_VERSION];

    return version;
}

+ (void) setAppVersion:(NSString *)version
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:version forKey:APP_VERSION];
    
    [defaults synchronize];
}

+ (NSString *) getUserEmail
{
    NSString * userEmail = nil;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    userEmail = [defaults objectForKey:USER_EMAIL];
    
    return userEmail;
}

+ (void) setUserEmail:(NSString *)email
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:email forKey:USER_EMAIL];
    
    [defaults synchronize];
}

+ (NSString *) getUserName
{
    NSString * userName = nil;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    userName = [defaults objectForKey:USER_NAME];
    
    return userName;
}

+ (void) setUserName:(NSString *)userName
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:userName forKey:USER_NAME];
    
    [defaults synchronize];
}

+ (NSString *) getPassword
{
    NSString * password = nil;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    password = [defaults objectForKey:USER_PASSWORD];
    
    return password;
}

+ (void) setPassword:(NSString *)password
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:password forKey:USER_PASSWORD];
    
    [defaults synchronize];
}



@end