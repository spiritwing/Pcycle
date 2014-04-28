//
//  LoginViewController.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-12.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController {
    MBProgressHUD *HUD;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self initBackGroundImageView];
    [self initNavigationBar];
    [self initTitleImageView];
    [self initTextFields];
    [self initButtons];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --------------- InitUI ---------------
- (void) initNavigationBar
{
    self.navigationBar.barTintColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f];
    self.registerButton.tintColor = [UIColor whiteColor];
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:LOGIN_TEXT];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font =[UIFont boldSystemFontOfSize:20];
    self.loginNavigationItem.titleView = customLab;

}


- (void) initTitleImageView
{
    self.titleBackImageView.frame = REGISTER_TITLE_IMAGE_FRAME;
    self.titleBackImageView.backgroundColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f] ;
    [self.view insertSubview:self.titleBackImageView atIndex:0];
}
- (void) initBackGroundImageView
{
    //设置背景图片
    UIImageView *backGroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:LOGIN_BACKGROUND_IMAGE]];
    backGroundView.frame = self.view.bounds;
    backGroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    [self.view insertSubview:backGroundView atIndex:0];
}

- (void) initTextFields
{
    //self.userNameField = [[UITextField alloc] initWithFrame:LOGIN_USERNAME_FIELD_FRAME];
    //self.userNameField.frame = LOGIN_USERNAME_FIELD_FRAME;
    [self.userNameField setBorderStyle:UITextBorderStyleRoundedRect];
    self.userNameField.placeholder = LOGIN_USERNAME_FIELD_PLACEHOLDER;
    self.userNameField.frame = LOGIN_USERNAME_FIELD_FRAME;

    self.userNameField.secureTextEntry = NO;
    self.userNameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.userNameField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.userNameField.keyboardType = UIKeyboardTypeEmailAddress;
    self.userNameField.textAlignment = NSTextAlignmentLeft;
    self.userNameField.returnKeyType = UIReturnKeyNext;
    self.userNameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.userNameField.delegate = self;
    
    
    
    [self.passwordField setBorderStyle:UITextBorderStyleRoundedRect];
    self.passwordField.placeholder = LOGIN_PASSWORD_FIELD_PLACEHOLDER;
    self.passwordField.frame = LOGIN_PASSWORD_FIELD_FRAME;
    self.passwordField.secureTextEntry = YES;
    self.passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordField.keyboardType = UIKeyboardTypeDefault;
    self.passwordField.textAlignment = NSTextAlignmentLeft;
    self.passwordField.returnKeyType = UIReturnKeyDone;
    self.passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.passwordField.enablesReturnKeyAutomatically = YES;
    self.passwordField.delegate = self;
}

-  (void) initButtons
{
    //self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [self.loginButton setBackgroundImage:[self createImageWithColor:[[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f]] forState:UIControlStateNormal];
    [self.loginButton setTitle:LOGIN_TEXT forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    
    
   
}


#pragma mark --------------- UITextFieldDelegate ---------------
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.userNameField)
    {
        [self.passwordField becomeFirstResponder];
    }
    [textField resignFirstResponder];
    return YES;
}




#pragma mark --------------- EventHandles ---------------

- (IBAction)backTap:(id)sender
{
    [self.userNameField resignFirstResponder];
    
    [self.passwordField resignFirstResponder];
}

- (IBAction)loginButton:(id)sender
{
    if (Authentication_Faild == [LoginFacade Authentication_userName:self.userNameField.text])
    {
        UIAlertView *alert = [ [UIAlertView alloc]
                              initWithTitle:REMINDER message:ERROR_EMAIL delegate:nil cancelButtonTitle:USER_CONFIRM otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.labelText = LOGINING;
        [self.view addSubview:HUD];
        [HUD showWhileExecuting:@selector(loginUser) onTarget:self withObject:nil animated:YES];
    }
}

- (void) loginUser
{
    NSLog(@"1");
    ErrorCode loginResult = [LoginFacade Login_UserName:self.userNameField.text Password:self.passwordField.text];
    NSLog(@"11");
    if (Succeed  == loginResult)
    {
        NSLog(@"succeed");
        [self performSelectorOnMainThread:@selector(goToCycleView) withObject:nil waitUntilDone:FALSE];
    }
    else if (Email_exsits_but_password_not_match == loginResult)
    {
        NSLog(@"12");
        [self performSelectorOnMainThread:@selector(passwordWrong) withObject:nil waitUntilDone:FALSE];
    }
    else
    {
        NSLog(@"13");
        [self performSelectorOnMainThread:@selector(wrong) withObject:nil waitUntilDone:FALSE];
    }
    
    
}

- (void) goToCycleView
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * cycleViewController = [mainStoryboard instantiateInitialViewController];
    [self presentViewController:cycleViewController animated:YES completion:nil];
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName: @"Main"bundle:nil];
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.rootViewController = [storyboard instantiateInitialViewController];
//    [self.window makeKeyAndVisible];
}

- (void) passwordWrong
{
    
}

- (void) wrong
{
    
}

//- (IBAction)registerButton:(id)sender
//{
//
//}

#pragma mark --------------- Screen ---------------

- (BOOL) shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)InterfaceOrientation {
    return (InterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark --------------- temp ---------------

- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}



@end