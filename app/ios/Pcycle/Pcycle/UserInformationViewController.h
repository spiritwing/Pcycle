//
//  UserInformation.h
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-15.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#ifndef Pcycle_UserInformation_h
#define Pcycle_UserInformation_h

#import <UIKit/UIKit.h>
#import "AppDefaultAndConstValue.h"
#import "CustomIOS7AlertView.h"

@interface UserInformationController : UIViewController<UITextFieldDelegate , UIPickerViewDelegate , UIPickerViewDataSource , CustomIOS7AlertViewDelegate>

@property (retain , nonatomic) IBOutlet UIImageView * titleImageView;
@property (retain , nonatomic) IBOutlet UINavigationBar * navigationBar;
@property (retain , nonatomic) IBOutlet UINavigationItem *userInfoNavigationItem;
@property (retain , nonatomic) IBOutlet UILabel *userNameLabel;
@property (retain , nonatomic) IBOutlet UILabel *userAgeLabel;
@property (retain , nonatomic) IBOutlet UILabel *userHeightLabel;
@property (retain , nonatomic) IBOutlet UILabel *userWeightLabel;

@property (retain , nonatomic) IBOutlet UITextField *userNameTextField;
@property (retain , nonatomic) IBOutlet UITextField *userAgeTextField;
@property (retain , nonatomic) IBOutlet UITextField *userHeightTextField;
@property (retain , nonatomic) IBOutlet UITextField *userWeightTextField;

@property (retain , nonatomic) IBOutlet UIButton *submitButton;




@end

#endif
