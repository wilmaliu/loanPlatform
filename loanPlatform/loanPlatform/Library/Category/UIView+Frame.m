//
//  UIView+Frame.m
//  cupid
//
//  Created by shouWang on 15/1/5.
//  Copyright (c) 2015年 VISION CORE CORP. All rights reserved.
//

#import "UIView+Frame.h"


@implementation UIView (Frame)


- (void)moveToOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void) moveUp:(CGFloat)height
{
    
    NSAssert(height >= 0, @"upheight shouldn't below 0");
    CGRect frame = self.frame;
    frame.origin.y -= height;
    self.frame = frame;
}


- (void) moveDown:(CGFloat)height
{
    NSAssert(height >=0, @"moveDown height shouldn't below 0");
    CGRect frame = self.frame;
    frame.origin.y += height;
    self.frame = frame;
}


- (void) moveUpKeepBottom:(CGFloat)height
{
    NSAssert(height >=0 , @"%s height shouldn't below 0",__func__);
    CGRect frame = self.frame;
    frame.origin.y -= height;
    frame.size.height +=height;
    self.frame = frame;

}

- (void) moveDownKeepBottom:(CGFloat)height
{
    NSAssert(height >= 0 , @"%s height should not below 0",__func__);
    CGRect frame = self.frame;
    CGFloat bottom = self.bottom;
    frame.origin.y += height;
    NSAssert1(frame.origin.y < bottom, @"%s height is too big", __func__);
    frame.size.height = bottom - frame.origin.y;
    self.frame = frame;
    
}

- (void) moveTo:(CGFloat)yPosition
{
    CGRect frame = self.frame;
    frame.origin.y = yPosition;
    self.frame = frame;
}
- (void) moveToKeepBottom:(CGFloat)yPosition
{
    CGRect frame = self.frame;
    CGFloat bottom = self.bottom;
    frame.origin.y = yPosition;
    NSAssert(bottom > yPosition, @"%s yPosition should not bigger than originY",__func__);
    frame.size.height = bottom - yPosition;
    self.frame = frame;
}

- (void)moveToY:(CGFloat)yPosition
{
    CGRect frame = self.frame;
    frame.origin.y = yPosition;
    self.frame = frame;
}
- (void)moveToX:(CGFloat)xPosition
{
    CGRect frame = self.frame;
    frame.origin.x = xPosition;
    self.frame = frame;
}




-(CGFloat)top {
    return self.frame.origin.y;
}

-(CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

-(CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)left {
    return self.frame.origin.x;
}

- (CGFloat)sjLeft
{
    return self.frame.origin.x;
}

- (void)setSjLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
 
- (CGFloat)sjTop
{
    return self.frame.origin.y;
}

- (void)setSjTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
 
- (CGFloat)sjRight
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setSjRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)sjBottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)sizeWidth
{
    return self.frame.size.width;
}

- (CGFloat)sizeHeight
{
    return self.frame.size.height;
}
- (CGFloat)originX
{
    return self.frame.origin.x;
}
- (CGFloat)originY
{
    return self.frame.origin.y;
}

- (void)setSjBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)sjCenterX
{
    return self.center.x;
}

- (void)setSjCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)sjCenterY
{
    return self.center.y;
}
 
- (void)setSjCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}
 
- (CGFloat)sjWidth
{
    return self.frame.size.width;
}
 
- (void)setSjWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)sjHeight
{
    return self.frame.size.height;
}
 
- (void)setSjHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
 
- (CGFloat)sjScreenX
{
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += [view sjLeft];
    }
    return x;
}

- (CGFloat)sjScreenY
{
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += [view sjTop];
    }
    return y;
}

- (CGFloat)sjScreenViewX
{
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += [view sjLeft];
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

- (CGFloat)sjScreenViewY
{
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += [view sjTop];
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)sjScreenFrame {
    return CGRectMake([self sjScreenViewX], [self sjScreenViewY], [self sjWidth], [self sjHeight]);
}

- (CGPoint)sjOrigin {
    return self.frame.origin;
}

- (void)setSjOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
 
- (CGSize)sjSize {
    return self.frame.size;
}
 
- (void)setSjSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
@end
