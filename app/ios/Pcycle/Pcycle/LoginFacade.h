//
//  LoginFacade.h
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-18.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#ifndef Pcycle_LoginFacade_h
#define Pcycle_LoginFacade_h

#import <Foundation/Foundation.h>
#import "Facade.h"
#import "UserDefaultHandler.h"
#import "NetworkHandler.h"
#import "Identifier.h"
#import "JsonHandler.h"

@interface LoginFacade : Facade

+ (BOOL) isLogin ;

+ (AuthenticationResult) Authentication_userName: (NSString *) userName;

+ (ErrorCode)Login_UserName: (NSString *) userName Password: (NSString *) password;

+ (ErrorCode)Register_UserName: (NSString *) userName Password: (NSString *) password;

+ (ErrorCode)Get_APP_Version;

@end


#endif
