//
//  SJRecentListView.m
//  loanPlatform
//
//  Created by zhoubl on 15/5/18.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "SJRecentListView.h"

@interface SJRecentListView ()<iCarouselDataSource,iCarouselDelegate>
@end

@implementation SJRecentListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpBanner];
        [self setUpList];
    }
    return self;
}

#pragma mark - Setup UI
- (void)setUpBanner
{
    iCarousel *banner = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth_C, 80)];
    [banner setBackgroundColor:[UIColor redColor]];
    banner.pagingEnabled = YES;
    banner.dataSource = self;
    banner.delegate = self;
    banner.autoscroll = 0.3;
    [self addSubview:banner];
}

- (void)setUpList
{
    
}

#pragma mark iCarousel methods
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 3;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, carousel.sjWidth, carousel.sjHeight)];
    }
    view.backgroundColor = index == 0 ? [UIColor colorWithHex:0x25bfff] : index == 1 ? [UIColor colorWithHex:0xff408c] : [UIColor colorWithHex:0xc143cb];
    return view;
}

#pragma mark -
#pragma mark iCarousel taps
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        case iCarouselOptionSpacing:
        case iCarouselOptionFadeMax:
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
}

@end
