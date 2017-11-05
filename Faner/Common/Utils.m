//
//  Utils.m
//  Faner
//
//  Created by apple on 2017/11/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+(UIColor *)getColorWithString:(NSString *)string
{
    NSScanner *scanner = [[NSScanner alloc] initWithString:string];
    unsigned color = 0;
    [scanner scanHexInt:&color];
    
    //    unsigned a = (color >> 24) & 0x000000FF;
    unsigned r = (color >> 16) & 0x000000FF;
    unsigned g = (color >> 8) & 0x000000FF;
    unsigned b = color & 0x000000FF;
    //    NSLog(@"rf is %f gf is %f bf is %f",r,g,b);
    
    CGFloat rf = (CGFloat)r / 255.f;
    CGFloat gf = (CGFloat)g / 255.f;
    CGFloat bf = (CGFloat)b / 255.f;
    //    CGFloat af = (CGFloat)a / 255.f;
    
    //    NSLog(@"rf is %f gf is %f bf is %f",rf,gf,bf);
    
    return [UIColor colorWithRed:rf green:gf blue:bf alpha:1.0f];
}

+(CGSize)getLabelSizeWithFont:(UIFont *)font string:(NSString *)text
{
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    return size;
}
@end
