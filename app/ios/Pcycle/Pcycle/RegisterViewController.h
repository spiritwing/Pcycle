//
//  RegisterViewController.h
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-12.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#ifndef Pcycle_RegisterViewController_h
#define Pcycle_RegisterViewController_h
#import <UIKit/UIKit.h>
#import "AppDefaultAndConstValue.h"
#import "LoginFacade.h"
#import "MBProgressHUD.h"
@interface RegisterViewController : UIViewController <UITextFieldDelegate>

@property (retain , nonatomic) IBOutlet UINavigationBar * navigationBar;
@property (retain , nonatomic) IBOutlet UINavigationItem * registerNavigationItem;
@property (retain , nonatomic) IBOutlet UIBarButtonItem *backButton ;
@property (retain , nonatomic) IBOutlet UIImageView *titleBackImageView;

@property (retain , nonatomic) IBOutlet UITextField *userNameTextField;
@property (retain , nonatomic) IBOutlet UITextField *passwordTextField;
@property (retain , nonatomic) IBOutlet UIButton *registerButton;

-(IBAction) btnRegisterButton:(id)sender;

@end


#endif
