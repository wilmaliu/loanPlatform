//
//  SJSettingViewController.m
//  loanPlatform
//
//  Created by wilma on 15/5/20.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJSettingViewController.h"

@interface SJSettingViewController ()
@property(nonatomic, strong) UIButton * mChangePwdBtn;
@property(nonatomic, strong) UIButton * mChangePowerBtn;
@end

@implementation SJSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设置";
    
    int offY = 30;
    int buttonWidth = self.view.frame.size.width/2-20;
    _mChangePwdBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, offY, buttonWidth, 30)];
    [_mChangePwdBtn setTitle:@"我发布的信息" forState:UIControlStateNormal];
    [_mChangePwdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_mChangePwdBtn setBackgroundColor:[UIColor blueColor]];
    [_mChangePwdBtn addTarget:self action:@selector(enterChangePwdView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_mChangePwdBtn];
    
    _mChangePowerBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2+10, offY, buttonWidth, 30)];
    [_mChangePowerBtn setTitle:@"设置" forState:UIControlStateNormal];
    [_mChangePowerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_mChangePowerBtn setBackgroundColor:[UIColor blueColor]];
    [_mChangePowerBtn addTarget:self action:@selector(enterChangePowerView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_mChangePowerBtn];
}

- (void)enterChangePwdView:(id)sender
{

}

- (void)enterChangePowerView:(id)sender
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
