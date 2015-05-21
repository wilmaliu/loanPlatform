//
//  SJMyPubTableViewCell.m
//  loanPlatform
//
//  Created by wilma on 15/5/20.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJMyPubTableViewCell.h"

@interface SJMyPubTableViewCell()


@property(nonatomic, strong)UILabel * mTitleLabel;
@property(nonatomic, strong)UILabel * mTimeView;
@property(nonatomic, strong)UILabel * mStatusView;
@property(nonatomic, strong)UILabel * mCostView;
@property(nonatomic, strong)UILabel * mCostStatusView;
@end

@implementation SJMyPubTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    int offX = 10;
    int offY = 10;
    int rightViewWidth = 80;
    _mTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(offX, offY, self.frame.size.width-100, 30)];
    [_mTitleLabel setTextAlignment:NSTextAlignmentLeft];
    [_mTitleLabel setTextColor:[UIColor blackColor]];
    [_mTitleLabel setNumberOfLines:1];
    [_mTitleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_mTitleLabel];
    
    offY += 40;
    _mTimeView = [[UILabel alloc] initWithFrame:CGRectMake(offX, offY, self.frame.size.width-offX-10, 30)];
    [_mTimeView setTextAlignment:NSTextAlignmentLeft];
    [_mTimeView setTextColor:[UIColor grayColor]];
    [_mTimeView setNumberOfLines:1];
    [_mTimeView setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_mTimeView];
    
    offY = 10;
    _mStatusView = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-10-rightViewWidth, offY, self.frame.size.width-offX-10, 30)];
    [_mStatusView setTextAlignment:NSTextAlignmentLeft];
    [_mStatusView setTextColor:[UIColor grayColor]];
    [_mStatusView setNumberOfLines:1];
    [_mStatusView setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_mStatusView];
    
    offY += 30;
    _mCostView = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-10-rightViewWidth, offY, self.frame.size.width-offX-10, 20)];
    [_mCostView setTextAlignment:NSTextAlignmentLeft];
    [_mCostView setTextColor:[UIColor grayColor]];
    [_mCostView setNumberOfLines:1];
    [_mCostView setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_mCostView];
    
    offY += 20;
    _mCostStatusView = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-10-rightViewWidth, offY, self.frame.size.width-offX-10, 20)];
    [_mCostStatusView setTextAlignment:NSTextAlignmentLeft];
    [_mCostStatusView setTextColor:[UIColor grayColor]];
    [_mCostStatusView setNumberOfLines:1];
    [_mCostStatusView setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_mCostStatusView];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMyPubCellData:(SJMyPublishItem*)data
{
    self.mTitleLabel.text = data.companyName;
    self.mTimeView.text = data.time;
    if(data.status == 1){
        self.mStatusView.text = @"已被采纳";
        self.mStatusView.textColor = [UIColor greenColor];
        self.mCostView.text = [NSString stringWithFormat: @"佣金 ：%ld元",data.commission];
        if(data.commissionStatus == 1){
            self.mCostStatusView.text = @"已发放";
        }else{
            self.mCostStatusView.text = @"未发放";
        }
    }else if(data.status == 2){
        self.mStatusView.text = @"发布中";
        self.mStatusView.textColor = [UIColor redColor];
    }else if(data.status == 3){
        self.mStatusView.text = @"已过期";
        self.mStatusView.textColor = [UIColor grayColor];
    }
    
    self.frame = CGRectMake(0, 0, self.frame.size.width, 90);
    
}

@end
