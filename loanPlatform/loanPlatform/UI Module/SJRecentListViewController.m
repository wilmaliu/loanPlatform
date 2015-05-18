//
//  SJRecentListViewController.m
//  loanPlatform
//
//  Created by zhoubl on 15/5/18.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJRecentListViewController.h"
#import "SJRecentListView.h"

@implementation SJRecentListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"全民推荐";
    
    SJRecentListView *list = [[SJRecentListView alloc] initWithFrame:FullViewSize];
    [self.view addSubview:list];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

@end
