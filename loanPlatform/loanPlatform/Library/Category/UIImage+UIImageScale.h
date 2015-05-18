//
//  UIImage+UIImageScale.h
//  dashi_iphone
//
//  Created by 云峰 张 on 11-10-26.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageScale)

- (UIImage *)scaleToSize:(CGSize) size;

- (UIImage *)getSubImage:(CGRect)rect;

- (UIImage *)scaletoScale:(float)scaleSize;

- (UIImage *)getThumbImage;

@end
