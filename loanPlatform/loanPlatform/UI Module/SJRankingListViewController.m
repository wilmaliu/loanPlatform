//
//  SJRankingListViewController.m
//  loanPlatform
//
//  Created by zhoubl on 15/5/18.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJRankingListViewController.h"
#import "SVPullToRefresh.h"
#import "SJUIRankTableViewCell.h"

@interface SJRankingListViewController()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation SJRankingListViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"月度排名";
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //下拉刷新
    __weak SJRankingListViewController * weakRankListViewController = self;
    [weakRankListViewController.tableView  addPullToRefreshWithActionHandler:^{
        [weakRankListViewController refreshAction];
        [weakRankListViewController performSelector:@selector(stopRefreshAnimation) withObject:nil afterDelay:3];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [_tableView triggerPullToRefresh];
}

//建立数据
- (void)setupDataSource {
    self.dataSource = [NSMutableArray array];
    for(int i=0; i<15; i++)
        [self.dataSource addObject:[NSDate dateWithTimeIntervalSinceNow:-(i*90)]];
}

//下拉刷新
-(void)refreshAction
{
    [_tableView reloadData];
}

//停止下拉刷新
-(void)stopRefreshAnimation
{
    [self.tableView.pullToRefreshView stopAnimating];
}



#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    SJUIRankTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell = [[SJUIRankTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setRankView:nil];
//    [cell.textLabel setText:[NSString stringWithFormat:@"%ld",indexPath.row]];
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SJUIRankTableViewCell *cell = (SJUIRankTableViewCell*) [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


@end
