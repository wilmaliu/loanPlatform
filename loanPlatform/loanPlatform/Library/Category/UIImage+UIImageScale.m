//
//  UIImage+UIImageScale.m
//  dashi_iphone
//
//  Created by 云峰 张 on 11-10-26.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIImage+UIImageScale.h"

@implementation UIImage (UIImageScale)

- (UIImage *) scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context  
    // 并把它设置成为当前正在使用的context  
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    
    // 绘制改变大小的图片  
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];  
    
    // 从当前context中创建一个改变大小后的图片  
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈  
    UIGraphicsEndImageContext();  
    
    // 返回新的改变大小后的图片  
    return scaledImage; 
}

-(UIImage*)getSubImage:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContextWithOptions(smallBounds.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    CGImageRelease(subImageRef);
    
    return smallImage;
}

- (UIImage *)scaletoScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width * scaleSize, self.size.height * scaleSize));
    [self drawInRect:CGRectMake(0, 0, self.size.width * scaleSize, self.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return scaledImage;
}

- (UIImage *)getThumbImage
{
    CGPoint clipOrigin = CGPointMake(0, 0);
    CGFloat imageWith = 0;
    if (self.size.width > self.size.height) {
        clipOrigin.x = (self.size.width - self.size.height) / 2;
        imageWith = self.size.height;
    } else {
        clipOrigin.y = (self.size.height - self.size.width) / 2;
        imageWith = self.size.width;
    }
    
    CGRect myImageRect = CGRectMake(clipOrigin.x, clipOrigin.y, imageWith, imageWith);
    
    CGImageRef imageRef = self.CGImage;
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    
    CGSize size;
    
    size.width = imageWith;
    
    size.height = imageWith;
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, myImageRect, subImageRef);
    
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    CGImageRelease(subImageRef);
    UIGraphicsEndImageContext();
    
    return smallImage;
}
                                
@end
