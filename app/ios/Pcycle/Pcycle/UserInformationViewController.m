//
//  UserInformation.m
//  Pcycle
//
//  Created by 郝 源顺 on 14-4-15.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "UserInformationViewController.h"

@interface UserInformationController()

@end

@implementation UserInformationController
NSArray * userAgeArray;
NSArray * userHeightArray;
NSArray * userWeightArray;
NSArray * secondHeightArray;
NSArray * secondHeightPresentArray;
NSArray * secondWeightArray;
NSArray * secondWeightPresentArray;
NSString * age;
NSString * height;
NSString * secondHeight;
NSString * weight;
NSString * secondWeight;
NSString * oldHeight;
NSString * oldWeight;

CustomIOS7AlertView * ageAlertView;
UIPickerView * agePickerView;

CustomIOS7AlertView * heightAlertView;
UIPickerView * heightPickerView;

CustomIOS7AlertView * weightAlertView;
UIPickerView * weightPickerView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initTitleImageView];
    [self initNavigationBar];
    [self initLabels];
    [self initTextFields];
    [self initButtons];
    [self initOlds];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --------------- Init UI ---------------
- (void) initNavigationBar
{
    self.navigationBar.barTintColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f];
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:USER_INFORMATION_TEXT];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font =[UIFont boldSystemFontOfSize:20];
    self.userInfoNavigationItem.titleView = customLab;
    
    
}
- (void) initTitleImageView
{
    self.titleImageView.frame = REGISTER_TITLE_IMAGE_FRAME;
    self.titleImageView.backgroundColor = [[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f] ;
    [self.view insertSubview:self.titleImageView atIndex:0];
}

- (void) initLabels
{
    self.userNameLabel.textAlignment = NSTextAlignmentLeft;
    self.userNameLabel.text = USER_NAME_TEXT;
    self.userNameLabel.font = [UIFont boldSystemFontOfSize:USER_INFORMATION_LABEL_FONT_SIZE];
    [self.userNameLabel setTextColor:[UIColor grayColor]];
    
    self.userAgeLabel.textAlignment = NSTextAlignmentLeft;
    self.userAgeLabel.text = USER_AGE_TEXT;
    self.userAgeLabel.font = [UIFont boldSystemFontOfSize:USER_INFORMATION_LABEL_FONT_SIZE];
    [self.userAgeLabel setTextColor:[UIColor grayColor]];
    
    self.userHeightLabel.textAlignment = NSTextAlignmentLeft;
    self.userHeightLabel.text = USER_HEIGHT_TEXT;
    self.userHeightLabel.font = [UIFont boldSystemFontOfSize:USER_INFORMATION_LABEL_FONT_SIZE];
    [self.userHeightLabel setTextColor:[UIColor grayColor]];
    
    self.userWeightLabel.textAlignment = NSTextAlignmentLeft;
    self.userWeightLabel.text = USER_WEIGHT_TEXT;
    self.userWeightLabel.font = [UIFont boldSystemFontOfSize:USER_INFORMATION_LABEL_FONT_SIZE];
    [self.userWeightLabel setTextColor:[UIColor grayColor]];

}
- (void) initTextFields
{
    [self.userNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    self.userNameTextField.textAlignment = NSTextAlignmentRight;
    self.userNameTextField.keyboardType = UIKeyboardTypeDefault;
    self.userNameTextField.returnKeyType = UIReturnKeyDone;
    self.userNameTextField.delegate = self;
    
    [self.userAgeTextField setBorderStyle:UITextBorderStyleRoundedRect];
    self.userAgeTextField.textAlignment = NSTextAlignmentRight;
    self.userAgeTextField.delegate =self;
    
    [self.userHeightTextField setBorderStyle:UITextBorderStyleRoundedRect];
    self.userHeightTextField.textAlignment = NSTextAlignmentRight;
    self.userHeightTextField.delegate = self;
    
    [self.userWeightTextField setBorderStyle:UITextBorderStyleRoundedRect];
    self.userWeightTextField.textAlignment = NSTextAlignmentRight;
    self.userWeightTextField.delegate = self;
}

- (void) initButtons
{
    [self.submitButton setBackgroundImage:[self createImageWithColor:[[UIColor alloc] initWithRed:SlidingPanelRedR/255.0 green:SlidingPanelRedG/255.0 blue:SlidingPanelRedB/255.0 alpha:1.0f]] forState:UIControlStateNormal];
    [self.submitButton setTitle:USER_SUBMIT_TEXT forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

- (UIView *) creatAgeAlert
{
    UIView * alertView = [[UIView alloc] initWithFrame:USER_ALERT_FRAME];
    agePickerView = [[UIPickerView alloc] init];
    age = [[NSString alloc] init];
    userAgeArray = [self createAgeArray];
    agePickerView.showsSelectionIndicator = YES;
    agePickerView.frame = USER_AGE_PICKER_FRAME;
    agePickerView.delegate = self;
    agePickerView.dataSource = self;
    [alertView addSubview:agePickerView];
    NSLog(@"--------picker");
    return alertView;
    
}

- (UIView *) creatHeightAlert
{
    UIView * alertView = [[UIView alloc] initWithFrame:USER_ALERT_FRAME];
    heightPickerView = [[UIPickerView alloc] init];
    userHeightArray = [self createHeightArray];
    secondHeightArray = [self createHeightSecondArray];
    heightPickerView.showsSelectionIndicator = YES;
    heightPickerView.frame = USER_HEIGHT_PICKER_FRAME;
    heightPickerView.delegate = self;
    heightPickerView.dataSource = self;
    [alertView addSubview:heightPickerView];
    return alertView;
    
}

- (UIView *) creatWeightAlert
{
    UIView * alertView = [[UIView alloc] initWithFrame:USER_ALERT_FRAME];
    weightPickerView = [[UIPickerView alloc] init];
    userWeightArray = [self createWeightArray];
    secondWeightArray = [self createWeightSecondArray];
    weightPickerView.showsSelectionIndicator = YES;
    weightPickerView.frame = USER_WEIGHT_PICKER_FRAME;
    weightPickerView.delegate = self;
    weightPickerView.dataSource = self;
    [alertView addSubview:weightPickerView];
    return alertView;
}

#pragma mark --------------- Init  ---------------
- (void) initOlds
{
    age = [NSString stringWithFormat:@"%d" , MIN_USER_AGE];
    height = [NSString stringWithFormat:@"%d",MIN_USER_HEIGHT ];
    secondHeight = [NSString stringWithFormat:@"%d" , 0];
    weight = [NSString stringWithFormat:@"%d" , MIN_USER_WEIGHT];
    secondWeight = [NSString stringWithFormat:@"%d" , 0];
}

#pragma mark --------------- UITextFieldDelegate ---------------
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField == self.userNameTextField)
    {
        return YES;
    }
    if(textField == self.userAgeTextField)
    {
        ageAlertView = [[CustomIOS7AlertView alloc] init];
        [ageAlertView setContainerView:[self creatAgeAlert]];
        [ageAlertView setButtonTitles:[NSMutableArray arrayWithObjects:USER_CANCEL, USER_CONFIRM,  nil]];
        [ageAlertView setDelegate:self];
        [ageAlertView setUseMotionEffects:TRUE];
        [ageAlertView show];
    }
    if(textField == self.userHeightTextField)
    {
        heightAlertView = [[CustomIOS7AlertView alloc] init];
        [heightAlertView setContainerView:[self creatHeightAlert]];
        [heightAlertView setButtonTitles:[NSMutableArray arrayWithObjects:USER_CANCEL, USER_CONFIRM,  nil]];
        [heightAlertView setDelegate:self];
        [heightAlertView setUseMotionEffects:TRUE];
        [heightAlertView show];
    }
    if(textField == self.userWeightTextField)
    {
        weightAlertView = [[CustomIOS7AlertView alloc] init];
        [weightAlertView setContainerView:[self creatWeightAlert]];
        [weightAlertView setButtonTitles:[NSMutableArray arrayWithObjects:USER_CANCEL, USER_CONFIRM,  nil]];
        [weightAlertView setDelegate:self];
        [weightAlertView setUseMotionEffects:TRUE];
        [weightAlertView show];
    }
    return NO;
}


#pragma mark --------------- EventHandles ---------------

- (IBAction)backTap:(id)sender
{
    [self.userNameTextField resignFirstResponder];
}

#pragma mark --------------- Delegate ---------------

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    //NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView tag]);
    if (alertView == ageAlertView)
    {
        if(buttonIndex == 1)
        {
            [self.userAgeTextField setText:age];
        }
        else
        {
            NSLog(@"%@",age);
        }
    }
    else if (alertView == heightAlertView)
    {
        if(buttonIndex == 1)
        {
            oldHeight = [NSString stringWithFormat:@"%@.%@" , height , secondHeight];
            [self.userHeightTextField setText:[NSString stringWithFormat:@"%@.%@cm" , height , secondHeight]];
        }
        else
        {
            
        }
    }
    else
    {
        if (buttonIndex == 1)
        {
            oldWeight = [NSString stringWithFormat:@"%@.%@" , weight , secondWeight];
            [self.userWeightTextField setText:[NSString stringWithFormat:@"%@.%@kg" , weight , secondWeight]];
        }
        else
        {
            
        }
    }
    [alertView close];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
	// 返回2表明该控件包含2列
    if (pickerView == agePickerView)
    {
        NSLog(@"Numberofcom ------------");

        return 1;
    }
	return 2;
}

// UIPickerViewDataSource中定义的方法，该方法返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
	if (pickerView == agePickerView)
    {
        NSLog(@"Numberofrow ------------");
        return userAgeArray.count;
    }
    else if (pickerView == heightPickerView)
    {
        if (component == 0)
        {
            return userHeightArray.count;
        }
        else
        {
            return secondHeightPresentArray.count;
        }
    }
    else
    {
        if (component == 0)
        {
            return userWeightArray.count;
        }
        else
        {
            return secondWeightPresentArray.count;
        }
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component

{
    if (pickerView == agePickerView)
    {
        return USER_PICKER_HEIGHT;
    }
    else if (pickerView == heightPickerView)
    {
        if (component == 0)
        {
            return USER_FIRST_PICKER_HEIGHT;
        }
        else
        {
            return USER_SECOND_PICKER_HEIGHT;
        }
    }
    else
    {
        if (component == 0)
        {
            return USER_FIRST_PICKER_HEIGHT;
        }
        else
        {
            return USER_SECOND_PICKER_HEIGHT;
        }
    }
    return USER_PICKER_HEIGHT;
}

// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为
// UIPickerView中指定列、指定列表项上显示的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == agePickerView)
    {
        return [userAgeArray objectAtIndex:row];
    }
    else if (pickerView == heightPickerView)
    {
        if (component == 0)
        {
            return [userHeightArray objectAtIndex:row];
        }
        else
        {
            return [secondHeightPresentArray objectAtIndex:row];
        }
    }
    else
    {
        if (component == 0)
        {
            return [userWeightArray objectAtIndex:row];
        }
        else
        {
            return [secondWeightPresentArray objectAtIndex:row];
        }
    }
}

// 当用户选中UIPickerViewDataSource中指定列、指定列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView == agePickerView)
    {
        age = [userAgeArray objectAtIndex:row];
        //[self.userAgeTextField setText:[userAgeArray objectAtIndex:row]];
    }
    else if (pickerView == heightPickerView)
    {
        if (component == 0)
        {
            height = [userHeightArray objectAtIndex:row];
        }
        else
        {
            secondHeight = [secondHeightArray objectAtIndex:row];
        }
    }
    else
    {
        if (component == 0)
        {
            weight = [userWeightArray objectAtIndex:row];
        }
        else
        {
            secondWeight = [secondWeightArray objectAtIndex:row];
        }
    }
}
// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为
// UIPickerView中指定列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView
	widthForComponent:(NSInteger)component
{
	if (pickerView == agePickerView)
    {
        return USER_PICKER_WIDTH;
    }
    else if (pickerView == heightPickerView)
    {
        if (component == 0)
        {
            return USER_FIRST_PICKER_WIDTH;
        }
        else
        {
            return USER_SECOND_PICKER_WIDTH;
        }
    }
    else
    {
        if (component == 0)
        {
            return USER_FIRST_PICKER_WIDTH;
        }
        else
        {
            return USER_SECOND_PICKER_WIDTH;
        }
    }
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

- (NSArray *) createAgeArray
{
    NSMutableArray * ageArray = [[NSMutableArray alloc] init];
    
    for (int i = MIN_USER_AGE ; i < MAX_USER_AGE; ++i)
    {
        [ageArray addObject:[NSString stringWithFormat:@"%d" , i]];
    }
    return ageArray;
}

- (NSArray *) createHeightArray
{
    NSMutableArray * heightArray = [[NSMutableArray alloc] init];
    
    for (int i = MIN_USER_HEIGHT ; i < MAX_USER_HEIGHT; ++i)
    {
        [heightArray addObject:[NSString stringWithFormat:@"%d" , i]];
    }
    return heightArray;
}

- (NSArray *) createWeightArray
{
    NSMutableArray * weightArray = [[NSMutableArray alloc] init];
    
    for (int i = MIN_USER_WEIGHT ; i < MAX_USER_WEIGHT; ++i)
    {
        [weightArray addObject:[NSString stringWithFormat:@"%d" , i]];
    }
    return weightArray;
}

- (NSArray *) createHeightSecondArray
{
    NSMutableArray * secondArray = [[NSMutableArray alloc] init];
    NSMutableArray * secondPresentArray = [[NSMutableArray alloc] init];
    for (int i = 0 ; i <10; i +=USER_HEIGHT_PRECISION)
    {
        [secondArray addObject:[NSString stringWithFormat:@"%d" , i]];
        [secondPresentArray addObject:[NSString stringWithFormat:@".%d" , i]];
    }
    secondHeightPresentArray = secondPresentArray;
    return secondArray;
}

- (NSArray *) createWeightSecondArray
{
    NSMutableArray * secondArray = [[NSMutableArray alloc] init];
    NSMutableArray * secondPresentArray = [[NSMutableArray alloc] init];
    
    for (int i = 0 ; i < 10; i += USER_WEIGHT_PRECISION)
    {
        [secondArray addObject:[NSString stringWithFormat:@"%d" , i]];
        [secondPresentArray addObject:[NSString stringWithFormat:@".%d" , i]];
    }
    secondWeightPresentArray = secondPresentArray;
    return secondArray;
}

@end