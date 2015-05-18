//
//  UIView+Frame.h
//  cupid
//
//  Created by shouWang on 15/1/5.
//  Copyright (c) 2015年 VISION CORE CORP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic,assign,readonly) CGFloat bottom;
@property (nonatomic,assign,readonly) CGFloat sizeWidth;
@property (nonatomic,assign,readonly) CGFloat sizeHeight;
@property (nonatomic,assign,readonly) CGFloat originX;
@property (nonatomic,assign,readonly) CGFloat originY;
@property (nonatomic,readonly,assign) CGFloat top;
@property (nonatomic,readonly,assign) CGFloat left;
@property (nonatomic,readonly,assign) CGFloat right;


- (void)moveToOrigin:(CGPoint)origin;

- (void) moveUp:(CGFloat)height;

- (void) moveDown:(CGFloat)height;


- (void) moveUpKeepBottom:(CGFloat)height;

- (void) moveDownKeepBottom:(CGFloat)height;

- (void) moveTo:(CGFloat)yPosition;
- (void) moveToKeepBottom:(CGFloat)yPosition;


- (void)moveToY:(CGFloat)yPosition;
- (void)moveToX:(CGFloat)xPosition;

@property (nonatomic) CGFloat sjLeft;

@property (nonatomic) CGFloat sjTop;

@property (nonatomic) CGFloat sjRight;

@property (nonatomic) CGFloat sjBottom;

@property (nonatomic) CGFloat sjWidth;

@property (nonatomic) CGFloat sjHeight;

@property (nonatomic) CGFloat sjCenterX;

@property (nonatomic) CGFloat sjCenterY;

@property (nonatomic, readonly) CGFloat sjScreenX;

@property (nonatomic, readonly) CGFloat sjScreenY;

@property (nonatomic, readonly) CGFloat sjScreenViewX;

@property (nonatomic, readonly) CGFloat sjScreenViewY;

@property (nonatomic, readonly) CGRect sjScreenFrame;

@property (nonatomic) CGPoint sjOrigin;

@property (nonatomic) CGSize sjSize;

@end
