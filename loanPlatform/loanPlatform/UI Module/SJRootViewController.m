//
//  SJRootViewController.m
//  loanPlatform
//
//  Created by zhoubl on 15/5/18.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "RDVTabBarItem.h"
#import "SJRootViewController.h"
#import "SJRecentListViewController.h"
#import "SJRecommendListViewController.h"
#import "SJRankingListViewController.h"
#import "SJPersonalCenterViewController.h"

@implementation SJRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SJRecentListViewController *firstViewController = [[SJRecentListViewController alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    SJRecommendListViewController *secondViewController = [[SJRecommendListViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    SJRankingListViewController *thirdViewController = [[SJRankingListViewController alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    SJPersonalCenterViewController *fourthViewController = [[SJPersonalCenterViewController alloc] init];
    UIViewController *fourthNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:fourthViewController];
    
    [self setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController,fourthNavigationController]];
    
    NSArray *itemName = @[@"业务",@"案例",@"排名",@"个人中心"];
    int i = 0;
    for (RDVTabBarItem *item in [[self tabBar] items])
    {
        item.title = itemName[i++];
    }
}

@end
