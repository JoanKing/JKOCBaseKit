//
//  NSAttributedString+Extension.m
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/9/2.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (Extension)

/**
 设置两段文字的富文本
 
 @param firstStr 第一段文字
 @param firstColor 第一段文字的颜色
 @param secondStr 第二段文字
 @param secondColor 第二段文字的颜色
 @param font 字体的大小
 @return 返回一个富文本
 */
+ (NSAttributedString *)cy_attributeFirstString:(NSString *)firstStr withFirstTextColor:(UIColor *)firstColor withSecondString:(NSString *)secondStr  withSecondTextColor:(UIColor *)secondColor withFont:(UIFont *)font {
    
    NSString *hintStr = [NSString stringWithFormat:@"%@%@",firstStr,secondStr];
    NSRange authrange1 = [hintStr rangeOfString:firstStr];
    NSRange authrange2 = [hintStr rangeOfString:secondStr];
    NSMutableAttributedString *attributehintStr = [[NSMutableAttributedString alloc]initWithString:hintStr];
    [attributehintStr addAttribute:NSForegroundColorAttributeName value:firstColor range:authrange1];
    [attributehintStr addAttribute:NSForegroundColorAttributeName value:secondColor range:authrange2];
    [attributehintStr addAttribute:NSFontAttributeName value:font range:authrange1];
    [attributehintStr addAttribute:NSFontAttributeName value:font range:authrange2];
    
    return [attributehintStr copy];
}

@end
