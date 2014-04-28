//
//  NetworkHandler.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-18.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "NetworkHandler.h"

@interface NetworkHandler ()

@end

@implementation NetworkHandler



+(NSData *) getAppVersionFromServer
{
    __block NSData * responseData = nil;
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    
    [manager GET:[SERVER_API stringByAppendingString:SERVER_API_VERSION]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@".....%@" , [[NSString alloc] initWithData: responseObject encoding: NSUTF8StringEncoding]);
         responseData = [[NSData alloc] initWithData : responseObject  ];
         
     }
     
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"error:-----------%@ ",error);
         }];
    
    return responseData;

}


+ (NSData *) login_Username:(NSString *)username Password:(NSString *)password
{
    __block NSData * responseData = nil;
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    NSLog(@"%@--------%@" , username , password);
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:username , USER_NAME_KEY, password, USER_PASSWORD_KEY, nil];
    NSLog(@"%@" , params);
    
    [manager POST:[SERVER_API stringByAppendingString:SERVER_API_LOGIN]
      parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@".....%@" , [[NSString alloc] initWithData: responseObject encoding: NSUTF8StringEncoding]);
         responseData = [[NSData alloc] initWithData : responseObject  ];
     }
     
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"error:-----------%@ ",error);
         }];
    //sleep(20);
//    responseData = [@"{\"sessionId\": \"f5df9ba38e6e7f57bd40af354d09db59a41735d8\", \"code\": 1}" dataUsingEncoding:NSUTF8StringEncoding ];
    do{
        sleep(1);
    }while (responseData == nil);
    return responseData;

}


+ (NSData *) register_Username:(NSString *)username Password:(NSString *)password
{
    __block NSData * responseData = nil;
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    NSLog(@"%@--------%@" , username , password);
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:username , USER_NAME_KEY, password, USER_PASSWORD_KEY, nil];
    NSLog(@"%@" , params);
    
    [manager POST:[SERVER_API stringByAppendingString:SERVER_API_REGISTER]
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"ssss");
         NSLog(@".....%@" , [[NSString alloc] initWithData: responseObject encoding: NSUTF8StringEncoding]);
         responseData = [[NSData alloc] initWithData : responseObject  ];
         NSLog(@"ssss");
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"error:-----------%@ ",error);
          }];
    //sleep(20);
    //    responseData = [@"{\"sessionId\": \"f5df9ba38e6e7f57bd40af354d09db59a41735d8\", \"code\": 1}" dataUsingEncoding:NSUTF8StringEncoding ];
    do{
        sleep(1);
    }while (responseData == nil);
    return responseData;
}




@end