//
//  UserDefaultHandler.h
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-18.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#ifndef Pcycle_UserDefaultHandler_h
#define Pcycle_UserDefaultHandler_h

#import <Foundation/Foundation.h>
#import "AppDefaultAndConstValue.h"

@interface  UserDefaultHandler : NSObject

+ (NSString*) getSessionId;

+ (void) setSessionId: (NSString *) sessionId;

+ (NSString *) getAppVersion;

+ (void) setAppVersion: (NSString *) version;

+ (NSString *) getUserEmail;

+ (void) setUserEmail: (NSString *) email;

+ (NSString *) getUserName;

+ (void) setUserName : (NSString *) userName;

+ (NSString *) getPassword;

+ (void) setPassword : (NSString *) password;

@end

#endif
