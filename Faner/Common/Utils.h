//
//  Utils.h
//  Faner
//
//  Created by apple on 2017/11/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Utils : NSObject
+(UIColor *)getColorWithString:(NSString *)string;
+(CGSize)getLabelSizeWithFont:(UIFont *)font string:(NSString *)text;
@end
