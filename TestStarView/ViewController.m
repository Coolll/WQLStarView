//
//  ViewController.m
//  TestStarView
//
//  Created by WQL on 16/1/14.
//  Copyright © 2016年 WQL. All rights reserved.
//

#import "ViewController.h"
#import "WQLStarView.h"
@interface ViewController ()
{
    WQLStarView *starView;
    
    UITextField *textF;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    starView = [[WQLStarView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40) withTotalStar:5 withTotalPoint:10 starSpace:10];
    starView.commentPoint = 7;
    [self.view addSubview:starView];

    textF = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 240, 100, 40)];
    textF.backgroundColor = [UIColor lightGrayColor];
    textF.delegate = self;
    textF.keyboardType = UIKeyboardTypeDecimalPad;
    [self.view addSubview:textF];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *string = textField.text;
    CGFloat point = [string floatValue];
    starView.commentPoint = point;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([textF isFirstResponder]) {
        [textF resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
