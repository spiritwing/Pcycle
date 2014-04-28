//
//  Identifier.h
//  TestIdentifier
//
//  Created by 郝 源顺 on 14-4-17.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#ifndef TestIdentifier_Identifier_h
#define TestIdentifier_Identifier_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

typedef enum
{
    IdentifierTypeKnown = 0,
    IdentifierTypeZipCode,      //1
    IdentifierTypeEmail,        //2
    IdentifierTypePhone,        //3
    IdentifierTypeUnicomPhone,  //4
    IdentifierTypeQQ,           //5
    IdentifierTypeNumber,       //6
    IdentifierTypeString,       //7
    IdentifierTypeIdentifier,   //8
    IdentifierTypePassort,      //9
    IdentifierTypeCreditNumber, //10
    IdentifierTypeBirthday,     //11
}IdentifierType;

@interface IdentifierValidator : NSObject
{
}

+ (BOOL) isValid:(IdentifierType) type value:(NSString*) value;

@end

//NSString+ITTAdditions.h

@interface NSString (ITTAdditions)

- (BOOL)isStartWithString:(NSString*)start;
- (BOOL)isEndWithString:(NSString*)end;

- (NSInteger)numberOfLinesWithFont:(UIFont*)font withLineWidth:(NSInteger)lineWidth;

- (CGFloat)heightWithFont:(UIFont*)font withLineWidth:(NSInteger)lineWidth;
- (CGFloat)widthWithFont:(UIFont*)font withLineHeight:(NSInteger)lineHeight;
- (NSString *)md5;

@end

//UIFont+ITTAdditions.h

@interface UIFont (ITTAdditions)

- (CGFloat)ittLineHeight;

@end

#endif
