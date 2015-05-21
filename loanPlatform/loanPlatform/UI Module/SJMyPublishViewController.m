//
//  SJMyPublishViewController.m
//  loanPlatform
//
//  Created by wilma on 15/5/20.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJMyPublishViewController.h"
#import "SVPullToRefresh.h"
#import "SJMyPubTableViewCell.h"
#import "SJMyPubTableViewCell.h"
#import "SJMyPublishItem.h"

@interface SJMyPublishViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic ,strong)NSMutableArray *dataSource;
@end

@implementation SJMyPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我发布的信息";
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //下拉刷新
    __weak SJMyPublishViewController * weakMyPubListViewController = self;
    [weakMyPubListViewController.tableView  addPullToRefreshWithActionHandler:^{
        [weakMyPubListViewController refreshAction];
        [weakMyPubListViewController performSelector:@selector(stopRefreshAnimation) withObject:nil afterDelay:3];
    }];
    
//    [weakMyPubListViewController.tableView  add:^{
//        [weakMyPubListViewController refreshAction];
//        [weakMyPubListViewController performSelector:@selector(stopRefreshAnimation) withObject:nil afterDelay:3];
//    }];

    [self initDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initDataSource
{
    _dataSource = [NSMutableArray array];
    SJMyPublishItem *item = [[SJMyPublishItem alloc] init];
    item.companyName = @"ABC公司需要被过桥";
    item.time = @"2015年1月2日";
    item.status = 1;
    item.commission = 5800;
    item.commissionStatus = 1;
    
    [_dataSource addObject:item];
    item = [[SJMyPublishItem alloc] init];
    item.companyName = @"北京天通有限公司需要被过桥";
    item.time = @"2015年2月5日";
    item.status = 2;
    item.commission = 0;
    item.commissionStatus = 0;
    [_dataSource addObject:item];
    
    item = [[SJMyPublishItem alloc] init];
    item.companyName = @"北京旗舰有限公司需要贷款";
    item.time = @"2015年5月5日";
    item.status = 3;
    item.commission = 0;
    item.commissionStatus = 0;
    [_dataSource addObject:item];
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
    if(_dataSource)
    {
        return [_dataSource count];
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    SJMyPubTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell = [[SJMyPubTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if(_dataSource){
        [cell setMyPubCellData:[_dataSource objectAtIndex:[indexPath row]]];
    }
    
    //    [cell.textLabel setText:[NSString stringWithFormat:@"%ld",indexPath.row]];
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SJMyPubTableViewCell *cell = (SJMyPubTableViewCell*) [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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
