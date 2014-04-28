//
//  RegisterViewController.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-12.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController {
    MBProgressHUD *HUD;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self initBackGroundImageView];
    [self initTitleImageView];
    [self initNavigationBar];
    [self initTextFields];
    [self initButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --------------- Init UI ---------------
- (void) initNavigationBar
{
    //self.backButton
    self.navigationBar.barTintColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f] ;
    self.backButton.tintColor = [UIColor whiteColor];
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:REGISTER_TEXT];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font =[UIFont boldSystemFontOfSize:20];
    self.registerNavigationItem.titleView = customLab;

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
    UIImageView *backGroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:REGISTER_BACKGROUND_IMAGE]];
    backGroundView.frame = self.view.bounds;
    backGroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    [self.view insertSubview:backGroundView atIndex:0];
}

- (void) initTextFields
{
    [self.userNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    self.userNameTextField.placeholder = REGISTER_USERNAME_FIELD_PLACEHOLDER;
    self.userNameTextField.frame = REGISTER_USERNAME_FIELD_FRAME;
    self.userNameTextField.secureTextEntry = NO;
    self.userNameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.userNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.userNameTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.userNameTextField.textAlignment = NSTextAlignmentLeft;
    self.userNameTextField.returnKeyType = UIReturnKeyNext;
    self.userNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.userNameTextField.delegate = self;
    
    
    
    [self.passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    self.passwordTextField.placeholder = REGISTER_PASSWORD_FIELD_PLACEHOLDER;
    self.passwordTextField.frame = REGISTER_PASSWORD_FIELD_FRAME;
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordTextField.keyboardType = UIKeyboardTypeDefault;
    self.passwordTextField.textAlignment = NSTextAlignmentLeft;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    self.passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.passwordTextField.enablesReturnKeyAutomatically = YES;
    self.passwordTextField.delegate = self;
}

- (void) initButtons
{
    [self.registerButton setBackgroundImage:[self createImageWithColor:[[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f]] forState:UIControlStateNormal];
    [self.registerButton setTitle:REGISTER_TEXT forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[self.registerButton.layer setCornerRadius:10.0];
    
    
}

#pragma mark --------------- UITextFieldDelegate ---------------
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.userNameTextField)
    {
        [self.passwordTextField becomeFirstResponder];
    }
    [textField resignFirstResponder];
    return YES;
}




#pragma mark --------------- EventHandles ---------------

- (IBAction)backTap:(id)sender
{
    [self.userNameTextField resignFirstResponder];
    
    [self.passwordTextField resignFirstResponder];
}

- (IBAction)btnRegisterButton:(id)sender
{
    if(Authentication_Faild == [LoginFacade Authentication_userName:self.userNameTextField.text])
    {
        UIAlertView *alert = [ [UIAlertView alloc]
                              initWithTitle:REMINDER message:ERROR_EMAIL delegate:nil cancelButtonTitle:USER_CONFIRM otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.labelText = REGISTERING;
        [self.view addSubview:HUD];
        [HUD showWhileExecuting:@selector(registerUser) onTarget:self withObject:nil animated:YES];
    }
    //[self performSegueWithIdentifier:USER_REGISTER_SEGUE sender:self];
}

- (void) registerUser
{
    ErrorCode registerResult = [LoginFacade Register_UserName:self.userNameTextField.text Password:self.passwordTextField.text];
    if(Succeed == registerResult)
    {
        NSLog(@"S");
        [self performSelectorOnMainThread:@selector(goToUserInfoView) withObject:nil waitUntilDone:FALSE];
        
    }
    else if (Email_used == registerResult)
    {
        NSLog(@"Email_used");
    }
    else
    {
        
    }
}

- (void) goToUserInfoView
{
    [self performSegueWithIdentifier:USER_REGISTER_TO_INFO_SEGUE sender:self];
}

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
#pragma mark --------------- Segue ---------------

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:USER_REGISTER_TO_INFO_SEGUE])
    {
        if([self.userNameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""])
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }else
    {
        return YES;
    }
    
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