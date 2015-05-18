//
//  z_UI.m
//  Template
//
//  Created by zhoubl on 13-6-5.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_UI.h"

@implementation z_UI

/**
 *	@brief	获取随即数
 *
 *	@param 	min 	最小数值
 *	@param 	max 	最大数值
 *
 *	@return	返回数值
 */
+ (NSInteger)getRandomNumber:(NSInteger)min maxNumber:(NSInteger)max
{
    NSInteger value=0;
    if(min>0)
        value= (arc4random() % (max-min+1)) + min;
    else
        value= arc4random() % max;
    return value;
}

/**
 *	@brief	通过字节获取文件大小
 *
 *	@param 	number 	字节数
 *
 *	@return	返回大小
 */
+ (NSString*)getSize:(NSNumber*)number

{
    int size=[number intValue];
    if(size<1024)
        return [NSString stringWithFormat:@"%uB", size];
    else
    {
        int size1=size/1024;
        if(size1<1024)
        {
            return [NSString stringWithFormat:@"%u.%uKB", size1,(size-size1*1024)/10];
        }
        else
        {
            int size2=size1/1024;
            if(size2<1024)
                return [NSString stringWithFormat:@"%u.%uMB", size2,(size1-size2*1024)/10];
        }
    }
    return nil;
}

/**
 *	@brief	转换字符串编码
 *
 *	@param 	s 	字符串
 *
 *	@return	返回UTF-8的编码
 */
+ (NSString *)encode:(NSString *)s
{
    return  [s stringByAddingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8)];
}


//从网络下载图片
+ (UIImage *)getImageFromURL:(NSString *)fileURL
{
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    return result;
}

//将所下载的图片保存到本地
+ (NSString *)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath
{
    NSString *patht = nil;
    if ([[extension lowercaseString] isEqualToString:@"png"])
    {
        patht = [directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]];
        [UIImagePNGRepresentation(image) writeToFile:patht options:NSAtomicWrite error:nil];
    }
    else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"])
    {
        patht = [directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]];
        [UIImageJPEGRepresentation(image, 0.5) writeToFile:patht options:NSAtomicWrite error:nil];
    }
    return patht;
}

+ (BOOL )testHasChineseWord:(NSString *)testString
{
    if (testString && ![testString isEqual:[NSNull null]])
    {
        for(int i = 0; i < [testString length]; i++)
        {
            int a = [testString characterAtIndex:i];
            if( a > 0x4e00 && a < 0x9fff)
            {
                return TRUE;
            }
        }
    }
    return NO;
}

+ (UIColor *)mostColor:(UIImage *)img
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(50, 50);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, img.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL)
    {
        CGContextRelease(context);
        return nil;
    }
    
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            
            int offset = 4*(x*y);
            
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
            
        }
    }
    CGContextRelease(context);
    
    
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        
        if ( tmpCount < MaxCount ) continue;
        
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}

+ (NSString *)testStringEmpty:(NSString *)str
{
    if (str == nil)
    {
        return nil;
    }
    else if ([str isEqual:[NSNull null]])
    {
        return nil;
    }
    else if ([str isEqualToString:@"<null>"]) {
        return nil;
    }
    else if ([str length] == 0)
    {
        return nil;
    }
    return str;
}

@end
