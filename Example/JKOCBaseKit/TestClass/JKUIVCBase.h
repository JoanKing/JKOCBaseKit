//
//  JKUIVCBase.h
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/7/10.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 每个部分的动画时间
#define kAnimationDuration 0.4 // (24/60)
// 延迟比 即上一动画执行到 1/3 执行下一部分
#define kAnimationDelayProportion (1.0 / 3) // (8/24)
// 动画幅度
#define kAnimationAffineTransform CGAffineTransformMakeTranslation(0, 30.f)
// 动画类型 快入缓出
#define kAnimationOptions UIViewAnimationOptionCurveEaseOut


typedef NS_ENUM(NSUInteger, CYTableViewCellAnimationType) {
    CYTableViewCellAnimationTypeRow     = 0, // 按照 row 动画
    CYTableViewCellAnimationTypeSection = 1, // 按照 section 动画
};


@interface JKUIVCBase : UIViewController

//返回
- (void)back;

@property (nonatomic, assign) BOOL needHideNavBar; // 是否需要隐藏导航栏，默认 NO 不隐藏，YES 隐藏
@property (nonatomic, assign) BOOL enablePanGesture;//是否支持拖动pop手势，默认yes,支持手势
@property (nonatomic, assign) BOOL openCellAndHeaderAnimateWhenScroll;//是否开始滚动动画 默认NO
@property (nonatomic, assign) BOOL cellAndHeaderAnimateOnlyOnce;//是否只执行依次动画，默认YES
// 动画延迟执行时间
@property (nonatomic, assign) NSTimeInterval animationDelay;
// Cell 动画方式 默认按照 row 动画
@property (nonatomic, assign) CYTableViewCellAnimationType cellAnimationType;

//清理动画缓存,清理之后可以再次动画
- (void)clearAnimatedCache;

//cell动画 （用于重写display方法适合调）
- (void)doCellAnimateWork:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath;

// 检测 Force Touch 是否可用
- (BOOL)isForceTouchCapabilityAvailable;


@end

NS_ASSUME_NONNULL_END
