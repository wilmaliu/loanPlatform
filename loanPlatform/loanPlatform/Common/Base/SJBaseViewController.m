//
//  SJBaseViewController.m
//  loanPlatform
//
//  Created by zhoubl on 15/5/17.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJBaseViewController.h"

@interface SJBaseViewController ()

@end

@implementation SJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 方向和状态栏控制
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    //这里写你需要的方向
    return UIInterfaceOrientationMaskPortrait;
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
