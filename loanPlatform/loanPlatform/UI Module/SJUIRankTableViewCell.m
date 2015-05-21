//
//  SJUIRankTableViewCell.m
//  loanPlatform
//
//  Created by wilma on 15/5/19.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJUIRankTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface SJUIRankTableViewCell()

@property(nonatomic, strong)UIImageView *mLeftImageView;
@property(nonatomic, strong)UILabel * mTitleView;
@property(nonatomic, strong)UILabel * mSubtitleView;
@end

@implementation SJUIRankTableViewCell

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
    int imageWidth = 100;
    int imageHeight = 70;
    _mLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(offX, offY, imageWidth, imageHeight)];
    [self.contentView addSubview:_mLeftImageView];
    
    offX = offX + imageWidth + 10;
    
    _mTitleView = [[UILabel alloc] initWithFrame:CGRectMake(offX, offY, self.frame.size.width-offX-10, 35)];
    [_mTitleView setTextAlignment:NSTextAlignmentLeft];
    [_mTitleView setTextColor:[UIColor blackColor]];
    [_mTitleView setNumberOfLines:2];
    [_mTitleView setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_mTitleView];
    
    
    _mSubtitleView = [[UILabel alloc] initWithFrame:CGRectMake(offX, 45, self.frame.size.width-offX-10, 35)];
    [_mSubtitleView setTextAlignment:NSTextAlignmentLeft];
    [_mSubtitleView setTextColor:[UIColor blackColor]];
    [_mSubtitleView setNumberOfLines:2];
    [_mSubtitleView setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_mSubtitleView];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRankView:(NSData*)data
{
    http://www.huabian.com/mingxingxiezheng/2014/0716/39388.html
     [_mLeftImageView sd_setImageWithURL:[NSURL URLWithString:@"http://img04.russian.china.com/app/3771/20150510/369395_89783.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [_mTitleView setText:@"ABC成功推荐＊＊公司"];
    [_mSubtitleView setText:@"获取佣金2万"];
    self.frame = CGRectMake(0, 0, self.frame.size.width, 90);
}

@end
