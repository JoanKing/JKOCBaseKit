//
//  JKUIVCBase.m
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/7/10.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import "JKUIVCBase.h"

@interface JKUIVCBase () <UINavigationControllerDelegate>
{
    UIBarButtonItem *_leftBarButtonItem;
}

@property (nonatomic, strong) NSMutableArray *animatedCellIndexPath;
@property (nonatomic, strong) NSMutableArray *animatedHeaderSection;
@property (nonatomic, strong) NSMutableArray *animatedFooterSection;

// 正在动画的 cell section 延时信息 key - section value - delay
@property (nonatomic, strong) NSMutableDictionary *cellSectionAnimations;

// 正在动画的 cell 个数
@property (nonatomic, assign) NSInteger cellAnimatingCount;
// 正在动画的 sectionHeader 个数
@property (nonatomic, assign) NSInteger headerAnimatingCount;
// 正在动画的 sectionFooter 个数
@property (nonatomic, assign) NSInteger footerAnimatingCount;

@end

@implementation JKUIVCBase

- (void)viewDidLoad {
    [super viewDidLoad];
    self.enablePanGesture = YES;
    self.cellAndHeaderAnimateOnlyOnce = YES;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    
    UIImage *bacckImage = [UIImage imageNamed:@"jun_back_black"];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:bacckImage
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backItem;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // 设置导航控制器代理
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // 不开启动画
    if (!self.openCellAndHeaderAnimateWhenScroll) { return; }
    
    if (self.cellAndHeaderAnimateOnlyOnce) {
        if ([self.animatedHeaderSection containsObject:@(section)]) { return; }
        [self.animatedHeaderSection addObject:@(section)];
    }
    
    CGFloat delay = self.headerAnimatingCount * kAnimationDuration * kAnimationDelayProportion + _animationDelay;
    self.headerAnimatingCount += 1;
    
    view.alpha = 0.;
    view.transform = kAnimationAffineTransform;
    [UIView animateWithDuration:kAnimationDuration delay:delay options:kAnimationOptions animations:^{
        view.alpha = 1.f;
        view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.headerAnimatingCount -= 1;
    }];
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    // 不开启动画
    if (!self.openCellAndHeaderAnimateWhenScroll) { return; }
    
    if (self.cellAndHeaderAnimateOnlyOnce) {
        if ([self.animatedFooterSection containsObject:@(section)]) { return; }
        [self.animatedFooterSection addObject:@(section)];
    }
    
    CGFloat delay = self.footerAnimatingCount * kAnimationDuration * kAnimationDelayProportion + _animationDelay;
    self.footerAnimatingCount += 1;
    
    view.alpha = 0.f;
    view.transform = kAnimationAffineTransform;
    [UIView animateWithDuration:kAnimationDuration delay:delay options:kAnimationOptions animations:^{
        view.alpha = 1.f;
        view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.footerAnimatingCount -= 1;
    }];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self doCellAnimateWork:cell indexPath:indexPath];
}


// MARK: - UIScrollViewDelegate

// 将要拖动的时候去掉延时
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.animationDelay = 0;
}


// MARK: - Animation

- (void)doCellAnimateWork:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    // 不开启动画
    if (!self.openCellAndHeaderAnimateWhenScroll) { return; }
    
    if (self.cellAndHeaderAnimateOnlyOnce) {
        if ([self.animatedCellIndexPath containsObject:indexPath]) { return; }
        [self.animatedCellIndexPath addObject:indexPath];
    }
    
    CGFloat delay = _animationDelay;
    if (_cellAnimationType == CYTableViewCellAnimationTypeSection) {
        NSString *sectionKey = [NSString stringWithFormat:@"%zd", indexPath.section];
        if ([self.cellSectionAnimations.allKeys containsObject:sectionKey]) {
            delay = [self.cellSectionAnimations[sectionKey] floatValue];
        } else {
            delay += self.cellSectionAnimations.count * kAnimationDuration * kAnimationDelayProportion;
            self.cellSectionAnimations[sectionKey] = @(delay);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.cellSectionAnimations removeObjectForKey:sectionKey];
            });
        }
    } else {
        delay += self.cellAnimatingCount * kAnimationDuration * kAnimationDelayProportion;
        self.cellAnimatingCount += 1;
    }
    
    cell.alpha = 0.0;
    cell.transform = kAnimationAffineTransform;
    
    [UIView animateWithDuration:kAnimationDuration delay:delay options:kAnimationOptions animations:^{
        cell.alpha = 1.f;
        cell.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.cellAnimatingCount -= 1;
    }];
}

- (void)clearAnimatedCache
{
    [self.animatedCellIndexPath removeAllObjects];
    [self.animatedHeaderSection removeAllObjects];
    [self.animatedFooterSection removeAllObjects];
    [self.cellSectionAnimations removeAllObjects];
}

// MARK: - Lazy

- (NSMutableArray *)animatedCellIndexPath
{
    if (!_animatedCellIndexPath) {
        _animatedCellIndexPath = [NSMutableArray array];
    }
    return _animatedCellIndexPath;
}

- (NSMutableArray *)animatedHeaderSection
{
    if (!_animatedHeaderSection) {
        _animatedHeaderSection = [NSMutableArray array];
    }
    return _animatedHeaderSection;
}

- (NSMutableArray *)animatedFooterSection
{
    if (!_animatedFooterSection) {
        _animatedFooterSection = [NSMutableArray array];
    }
    return _animatedFooterSection;
}

- (NSMutableDictionary *)cellSectionAnimations {
    if (!_cellSectionAnimations) {
        _cellSectionAnimations = [NSMutableDictionary dictionary];
    }
    return _cellSectionAnimations;
}

// MARK: - Others

- (BOOL)isForceTouchCapabilityAvailable {
    return [self respondsToSelector:@selector(traitCollection)]
    && [self.traitCollection respondsToSelector:@selector(forceTouchCapability)]
    && self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc
{
    _leftBarButtonItem = nil;
}

@end
