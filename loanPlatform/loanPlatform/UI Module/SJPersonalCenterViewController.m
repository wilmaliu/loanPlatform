//
//  SJPersonalCenterViewController.m
//  loanPlatform
//
//  Created by zhoubl on 15/5/18.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJPersonalCenterViewController.h"
#import "SJMyPublishViewController.h"
#import "SJSettingViewController.h"

@interface SJPersonalCenterViewController ()

@property(nonatomic, strong) UILabel *mLeftStaticTextView;
@property(nonatomic, strong) UILabel *mPulishStatusView;

@property(nonatomic, strong) UIButton * mMyPublishBtn;
@property(nonatomic, strong) UIButton * mSettingBtn;

@end

@implementation SJPersonalCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"个人中心";
    [self initView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)initView
{
    int offX = 10;
    int offY = 20;
    _mLeftStaticTextView = [[UILabel alloc] initWithFrame:CGRectMake(offX, offY, 150, 30)];
    [_mLeftStaticTextView setTextAlignment:NSTextAlignmentLeft];
    [_mLeftStaticTextView setTextColor:[UIColor blackColor]];
    [_mLeftStaticTextView setNumberOfLines:1];
    [_mLeftStaticTextView setFont:[UIFont systemFontOfSize:15]];
    [_mLeftStaticTextView setText:@"过桥资质申请状态:"];
    [self.view addSubview:_mLeftStaticTextView];
    
    offX = offX + 150;
    _mPulishStatusView = [[UILabel alloc] initWithFrame:CGRectMake(offX, offY, self.view.frame.size.width-offX-10, 30)];
    [_mPulishStatusView setTextAlignment:NSTextAlignmentLeft];
    [_mPulishStatusView setTextColor:[UIColor blackColor]];
    [_mPulishStatusView setNumberOfLines:1];
    [_mPulishStatusView setFont:[UIFont systemFontOfSize:15]];
    [_mLeftStaticTextView setText:@"过桥资质申请状态:"];
    [self.view addSubview:_mPulishStatusView];
    
    offY = offY +30 +20;
    int buttonWidth = self.view.frame.size.width/2-20;
    _mMyPublishBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, offY, buttonWidth, 30)];
    [_mMyPublishBtn setTitle:@"我发布的信息" forState:UIControlStateNormal];
    [_mMyPublishBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_mMyPublishBtn setBackgroundColor:[UIColor blueColor]];
    [_mMyPublishBtn addTarget:self action:@selector(enterMyPulishListView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_mMyPublishBtn];
    
    _mSettingBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2+10, offY, buttonWidth, 30)];
    [_mSettingBtn setTitle:@"设置" forState:UIControlStateNormal];
    [_mSettingBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_mSettingBtn setBackgroundColor:[UIColor blueColor]];
    [_mSettingBtn addTarget:self action:@selector(enterSettingView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_mSettingBtn];
    
}



- (void)enterMyPulishListView:(id)sender
{
    SJMyPublishViewController * sjMyPubViewController = [[SJMyPublishViewController alloc] init];
    [self.navigationController pushViewController:sjMyPubViewController animated:YES];
}

- (void)enterSettingView:(id)sender
{
    SJSettingViewController * sjSettingViewController = [[SJSettingViewController alloc] init];
    [self.navigationController pushViewController:sjSettingViewController animated:YES];
}


@end
