//
//  JKMacro.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/7.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#pragma mark 1、NSLog的宏
/** 1、NSLog的宏 */
#ifdef DEBUG
#define JKLog(...) NSLog(@"%s 第%d行: %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define JKLog(...)
#endif

#pragma mark 2、APP版本号
/** 2、APP版本号 */
#define JKAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// build 可以更改，上线后版本号还是保持上面的
#define JKAppBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#pragma mark  3、app的名字 CFBundleName
#define JKAppName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]

#pragma mark 4、系统版本号
/** 4、系统版本号 */
#define kSystemVersion [[UIDevice currentDevice] systemVersion]

#pragma mark 5、随机色与RGB颜色
/** 5、随机色与RGB颜色 */
#define JKRandomColor  [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1.0]
#define JKRGBColor(r,g,b,p) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:p]
// 使用举例：JKHEXCOLOR(0xf0f0f6);
#define JKHEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0  \
                           green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
                           blue:((float)(rgbValue & 0xFF)) / 255.0 \
                           alpha:1.0]

#pragma mark 6、存值、取值、存BOOL值
/** 6、存值、取值、存BOOL值 */
//存值(可变的值不可以存)
#define JKUserDefaultSetValue(B,C) [[NSUserDefaults standardUserDefaults]setObject:B forKey:C]; \
[[NSUserDefaults standardUserDefaults]synchronize]
// 取值
#define JKUserDefaultObject(A) [[NSUserDefaults standardUserDefaults]objectForKey:A]
// 存BOOL值
#define JKUserDefaultBool(D,E)  [[NSUserDefaults standardUserDefaults]setBool:D forKey:E]; \
[[NSUserDefaults standardUserDefaults]synchronize]

#pragma mark 7、弱引用/强引用
/** 7、弱引用/强引用 */
#define JKWeakSelf(type) __weak typeof(type) weak##type = type
#define JKStrongSelf(type) __strong typeof(type) type = weak##type;

#pragma mark 8、快速查询一段代码的执行时间
/** 8、快速查询一段代码的执行时间 */
#define JKStartTime NSDate *startTime = [NSDate date];
#define JKEndTime NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);

#pragma mark 9、屏幕比例
/** 9、屏幕比例 */
#define JKSizeHeightScale ((CIO_SCREEN_HEIGHT > 667) ? CIO_SCREEN_HEIGHT/667 : 1)
#define JKSizeWidthScale ((CIO_SCREEN_WIDTH > 375) ? CIO_SCREEN_WIDTH/375 : 1)

#pragma mark 10、获取当前语言
/** 10、获取当前语言 */
#define JKCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#pragma mark 11、由角度转换弧度
/** 11、由角度转换弧度 */
#define kDegreesToRadian(x) (M_PI * (x) / 180.0)

#pragma mark 11、由弧度转换角度
/** 12、由弧度转换角度 */
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

#pragma mark 12、图片加载
/** 13、图片 */
// 根据路径加载一个图片
#define JKImageOfFile(NAME,EXT) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]
// 根据图片名加载一个图片
#define JKImageNamed(NAME) [UIImage imageNamed:NAME]

#pragma mark 13、字体大小（常规/粗体）
/** 14、字体大小（常规/粗体） */
#define JKBoldFont(FONTSIZE)      [UIFont boldSystemFontOfSize:FONTSIZE]
#define JKSystemFont(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define JKFont(NAME,FONTSIZE)     [UIFont fontWithName:(NAME) size:(FONTSIZE)]

#pragma mark 15.JKOCProjectTool.bundle 路径的查找
/**
 15.JKOCProjectTool.bundle 路径的查找

 @param file 传入图片的名字
 @return 返回一个UIImage图片的对象
 */
#define IMBaseKitBundlePath(file) [@"IMBaseKit.bundle" stringByAppendingPathComponent:file]
#define IMBaseKitFrameworkBundlePath(file) [@"Frameworks/IMBaseKit.framework/IMBaseKit.bundle" stringByAppendingPathComponent:file]
#define IMBaseKitBundleImageName(file)  [UIImage imageNamed:IMBaseKitBundlePath(file)] ? :[UIImage imageNamed:IMBaseKitFrameworkBundlePath(file)]

#pragma mark 16、获取随机数小数(0-1之间)
/** 16、获取随机数小数(0-1之间) */
#define JKARC4RANDOM_MAX      0x100000000double val = ((double)arc4random() / ARC4RANDOM_MAX);

#pragma mark 17、通过路径加载本地的图片
/**
 17、通过路径加载本地的图片

 @param filename 图片的名字
 @param ext 图片的类型
 @return 返回一个UIImage实例对象
 */
#define JKLoadImage(filename,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

#pragma mark 18、强制让App直接退出（非闪退，非崩溃）
/**
 18、强制让App直接退出（非闪退，非崩溃）
 */
#define JKExitApplication \
UIWindow *window = [AppDelegate new].window;\
[UIView animateWithDuration:1.0f animations:^{\
    window.alpha = 0;\
} completion:^(BOOL finished) {\
    exit(0);\
}];

#pragma mark 19、调用代码使APP进入后台，达到点击Home键的效果
/**
 19、调用代码使APP进入后台，达到点击Home键的效果
 */
#define JKHomeBackGroundState [[UIApplication sharedApplication] performSelector:@selector(suspend)]
