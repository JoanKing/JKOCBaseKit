//
//  NSAttributedString+Extension.h
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/9/2.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (Extension)

/**
 设置两段文字的富文本
 
 @param firstStr 第一段文字
 @param firstColor 第一段文字的颜色
 @param secondStr 第二段文字
 @param secondColor 第二段文字的颜色
 @param font 字体的大小
 @return 返回一个富文本
 */
+ (NSAttributedString *)cy_attributeFirstString:(NSString *)firstStr withFirstTextColor:(UIColor *)firstColor withSecondString:(NSString *)secondStr  withSecondTextColor:(UIColor *)secondColor withFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
