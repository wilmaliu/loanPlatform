//
//  SJRecommendListViewController.m
//  loanPlatform
//
//  Created by zhoubl on 15/5/18.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJRecommendListViewController.h"
#import "SVPullToRefresh.h"

@interface SJRecommendListViewController()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)UITableView *tableView;

@end

@implementation SJRecommendListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"成功案例";
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

@end
