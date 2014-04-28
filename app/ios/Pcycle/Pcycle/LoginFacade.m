//
//  LoginFacade.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-18.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#include "LoginFacade.h"

@interface LoginFacade ()

@end

@implementation LoginFacade

+ (BOOL) isLogin
{
    BOOL loginFlag= FALSE;
    
    if (nil != [UserDefaultHandler getSessionId])
    {
        loginFlag = TRUE;
    }
    
    return loginFlag;
}

+ (AuthenticationResult) Authentication_userName:(NSString *)userName
{
    if ([IdentifierValidator isValid:IdentifierTypeEmail value:userName])
    {
        return Authentication_Succeed;
    }
    return Authentication_Faild;
}

+ (ErrorCode)Get_APP_Version
{
    NSData * serverResponse = [NetworkHandler getAppVersionFromServer];
    
    NSDictionary * versionDic = [JsonHandler AnalysisAppVersion:serverResponse];
    
    if(nil == [versionDic objectForKey:REQUEST_TIMEOUT_KEY])
    {
        
    }
    else
    {
        return Request_timeout;
    }
    
    return Succeed;
}


+ (ErrorCode) Login_UserName:(NSString *)userName Password:(NSString *)password
{
    NSData * serverResponse = [NetworkHandler login_Username:userName Password:password];
    
    NSDictionary * logindic = [JsonHandler AnalysisUserLoginData:serverResponse];
    NSLog(@"112");
    if (REQUEST_FAILD == [logindic objectForKey:SERVER_CODE])
    {
        if (Email_exsits_but_password_not_match == [logindic objectForKey: ERROR_CODE])
        {
            return Email_exsits_but_password_not_match;
        }
        
    }
    else
    {
        [UserDefaultHandler setSessionId:[logindic objectForKey:USER_LOGIN_SESSIONID]];
        [UserDefaultHandler setUserName:userName];
        [UserDefaultHandler setPassword:password];
    }
    
    return Succeed;
}

+ (ErrorCode) Register_UserName : (NSString *) userName Password: (NSString *) password
{
    NSData * serverResponse = [NetworkHandler register_Username:userName Password:password];
    
    NSDictionary * registerdic = [JsonHandler AnalysisUserRegisterData:serverResponse];
    NSLog(@"112");
    if (REQUEST_FAILD == [registerdic objectForKey:SERVER_CODE])
    {
        if (Email_used == [registerdic objectForKey: ERROR_CODE])
        {
            return Email_used;
        }
    }
    else
    {
        [UserDefaultHandler setSessionId:[registerdic objectForKey:USER_LOGIN_SESSIONID]];
        [UserDefaultHandler setUserName:userName];
        [UserDefaultHandler setPassword:password];
    }
    
    return Succeed;

}

@end

