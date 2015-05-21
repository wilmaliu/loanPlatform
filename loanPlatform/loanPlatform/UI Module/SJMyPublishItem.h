//
//  SJMyPublishItem.h
//  loanPlatform
//
//  Created by wilma on 15/5/20.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJMyPublishItem : NSData

@property(nonatomic, strong)NSString * companyName;
@property(nonatomic, strong)NSString * time;
@property(nonatomic, assign)NSInteger  status;
@property(nonatomic, assign)NSInteger commission;
@property(nonatomic, assign)NSInteger commissionStatus;

@end
