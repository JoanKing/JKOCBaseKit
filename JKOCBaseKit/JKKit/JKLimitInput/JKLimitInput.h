//
//  JKLimitInput.h
//  JKTextViewAndUITextFieldImputLimit
//
//  Created by 王冲 on 2017/12/19.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#define JK_PROPERTY_NAME @"limit"

#define DECLARE_PROPERTY(className) \
@interface className (Limit) @end

DECLARE_PROPERTY(UITextField)
DECLARE_PROPERTY(UITextView)

@interface JKLimitInput : NSObject

@property(nonatomic, assign) BOOL enableLimitCount;

/**  可限制输入的字符个数 
 
 [UITextField的对象 setValue:@10 forKey:@"limit"];
 
 */

+(JKLimitInput *) sharedInstance;


@end

