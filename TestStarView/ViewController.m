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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WQLStarView *starView = [[WQLStarView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40) withTotalStar:5 withTotalPoint:10 starSpace:10];
    starView.commentPoint = 7;
//    starView.starAliment = StarAlimentCenter;
    [self.view addSubview:starView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
