//
//  UIView+JKLayout.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/4.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UIView+JKLayout.h"
#import <objc/runtime.h>

static char JKActionHandlerTapBlockKey;
static char JKActionHandlerTapGestureKey;
static char JKActionHandlerLongPressGestureKey;
static char JKActionHandlerLongPressBlockKey;

@implementation UIView (JKLayout)

#pragma mark x
-(void)setJk_x:(CGFloat)jk_x{
    
    CGRect frame = self.frame;
    frame.origin.x = jk_x;
    self.frame = frame;
}

-(CGFloat)jk_x{
    
    return self.frame.origin.x;
}

#pragma mark y
-(void)setJk_y:(CGFloat)jk_y{
    CGRect frame = self.frame;
    frame.origin.y = jk_y;
    self.frame = frame;
}
-(CGFloat)jk_y{
    return self.frame.origin.y;
}

#pragma mark width
-(void)setJk_width:(CGFloat)jk_width{
    
    CGRect frame = self.frame;
    frame.size.width = jk_width;
    self.frame = frame;
}

-(CGFloat)jk_width{
    return self.frame.size.width;
}

#pragma mark height
-(void)setJk_height:(CGFloat)jk_height{
    CGRect frame = self.frame;
    frame.size.height = jk_height;
    self.frame = frame;
}

-(CGFloat)jk_height{
    return self.frame.size.height;
}

#pragma mark centerX

-(void)setJk_centerX:(CGFloat)jk_centerX{
    CGPoint center = self.center;
    center.x = jk_centerX;
    self.center = center;
}

-(CGFloat)jk_centerX{
    
    return self.center.x;
}

#pragma mark centerY

-(void)setJk_centerY:(CGFloat)jk_centerY{
    
    CGPoint center = self.center;
    center.y = jk_centerY;
    self.center = center;
}

-(CGFloat)jk_centerY{
    return self.center.y;
}


#pragma mark origin

-(CGPoint)jk_origin{
    return self.frame.origin;
}
-(void)setJk_origin:(CGPoint)jk_origin{
    CGRect frame = self.frame;
    frame.origin = jk_origin;
    self.frame = frame;
}

#pragma mark size
-(void)setJk_size:(CGSize)jk_size{
    CGRect frame = self.frame;
    frame.size = jk_size;
    self.frame = frame;
}

-(CGSize)jk_size{
    return self.frame.size;
}

#pragma mark 上
-(CGFloat)jk_top{
    return self.frame.origin.y;
}

-(void)setJk_top:(CGFloat)jk_top{
    CGRect frame = self.frame;
    frame.origin.y = jk_top;
    self.frame = frame;
}

#pragma mark 左
-(CGFloat)jk_left{
    return self.frame.origin.x;
}

-(void)setJk_left:(CGFloat)jk_left{
    CGRect frame = self.frame;
    frame.origin.x = jk_left;
    self.frame = frame;
}

#pragma mark 下
-(CGFloat)jk_bottom{
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setJk_bottom:(CGFloat)jk_bottom{
    CGRect frame = self.frame;
    frame.origin.y = jk_bottom - frame.size.height;
    self.frame = frame;
}

#pragma mark 右
-(CGFloat)jk_right{
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setJk_right:(CGFloat)jk_right{
    CGRect frame = self.frame;
    frame.origin.x = jk_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)jk_ScreenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.jk_left;
    }
    return x;
}

- (CGFloat)jk_ScreenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.jk_top;
    }
    return y;
}

- (CGFloat)jk_ScreenViewX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.jk_left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

- (CGFloat)jk_ScreenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.jk_top;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)jk_ScreenFrame {
    return CGRectMake(self.jk_ScreenViewX, self.jk_ScreenViewY, self.jk_width, self.jk_height);
}

- (void)setBorderWidth:(NSInteger)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (NSInteger)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderHexRgb:(NSString *)borderHexRgb
{
    NSScanner *scanner = [NSScanner scannerWithString:borderHexRgb];
    unsigned hexNum;
    //这里是将16进制转化为10进制
    if (![scanner scanHexInt:&hexNum])
        return;
    self.layer.borderColor = [self colorWithRGBHex:hexNum].CGColor;
}

- (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}


-(NSString *)borderHexRgb
{
    return @"0xffffff";
}

- (NSArray *)jk_allSubviews
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    [array addObjectsFromArray:self.subviews];
    
    for (UIView *view in self.subviews)
    {
        [array addObjectsFromArray:[view jk_allSubviews]];
    }
    
    return array;
}

- (void)jk_removeAllSubviews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (UIViewController *)jk_findCurrentViewController;
{
    UIResponder *responder = self.nextResponder;
    do
    {
        if ([responder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    }
    while (responder);
    
    return nil;
}

- (UIView *)jk_findFirstResponder
{
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder))
    {
        return self;
    }
    
    for (UIView *v in self.subviews)
    {
        UIView *fv = [v jk_findFirstResponder];
        if (fv)
        {
            return fv;
        }
    }
    
    return nil;
}

- (void)jk_addTapActionWithBlock:(TapActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &JKActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &JKActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &JKActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        TapActionBlock block = objc_getAssociatedObject(self, &JKActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}


- (void)jk_addLongPressActionWithBlock:(LongPressActionBlock)block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &JKActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &JKActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &JKActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForLongPressGesture:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        LongPressActionBlock block = objc_getAssociatedObject(self, &JKActionHandlerLongPressBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

/**-----------**/

-(BOOL)isShowingOnWindow{
    
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    
    
    //nil = [UIApplication sharedApplication].keyWindow
    //转换坐标系
    CGRect newFrame = [self.superview convertRect:self.frame toView:keywindow];
    
    //CGRect newFrame = [[UIApplication sharedApplication].keyWindow convertRect:subview.frame fromView:subview.superview];
    
    CGRect windowBouns = keywindow.bounds;
    
    BOOL intersects =  CGRectIntersectsRect(newFrame, windowBouns);
    
    
    //判断一个控件是否真正显示在窗口范围内
    
    return !self.isHidden && self.alpha > 0.01 && intersects && self.window == keywindow;
    
}

/**-----------**/

-(void)jkCutRoundRectCorner:(UIRectCorner)corners withCornerRadius:(CGFloat)value{
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(value, value)];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

/**-----------**/

- (void)jk_addShadowToViewShadowRadius:(CGFloat)shadowRadius withColor:(UIColor *)theColor withShadowOffset:(CGSize)size withShadowOpacity:(float)opacity{
    
    // 阴影颜色
    self.layer.shadowColor = theColor.CGColor;
    // 阴影的偏移 CGSizeMake(X[正的右偏移,负的左偏移], Y[正的下偏移,负的上偏移]);
    self.layer.shadowOffset = size;
    // 阴影透明度，默认0,不透明度(不透明度只要大于1就说明是有阴影的)
    self.layer.shadowOpacity = opacity;
    // 阴影半径，默认3
    self.layer.shadowRadius = shadowRadius;
}

/**-----------**/

- (void)jk_addShadowSingleToViewShadowRadius:(CGFloat)shadowRadius withColor:(UIColor *)theColor withShadowOffset:(CGSize)size withShadowOpacity:(float)opacity{
    
    self.layer.shadowColor = theColor.CGColor;
    self.layer.shadowOffset = size;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = shadowRadius;
    // 单边阴影 顶边
    float shadowPathWidth = self.layer.shadowRadius;
    CGRect shadowRect = CGRectMake(0, 0-shadowPathWidth/2.0, self.bounds.size.width, shadowPathWidth);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = path.CGPath;
}

/**-----------**/

+ (Class)layerClass {
    return [CAGradientLayer class];
}

+ (UIView *)jk_gradientViewWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIView *view = [[self alloc] init];
    [view jk_setGradientBackgroundWithColors:colors locations:locations startPoint:startPoint endPoint:endPoint];
    return view;
}

- (void)jk_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    NSMutableArray *colorsM = [NSMutableArray array];
    
    for (UIColor *color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    self.jk_colors = [colorsM copy];
    self.jk_locations = locations;
    self.jk_startPoint = startPoint;
    self.jk_endPoint = endPoint;
}

- (NSArray *)jk_colors {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setJk_colors:(NSArray *)colors {
    objc_setAssociatedObject(self, @selector(jk_colors), colors, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setColors:self.jk_colors];
    }
}

- (NSArray<NSNumber *> *)jk_locations {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setJk_locations:(NSArray<NSNumber *> *)locations {
    objc_setAssociatedObject(self, @selector(jk_locations), locations, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setLocations:self.jk_locations];
    }
}

- (CGPoint)jk_startPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

-(void)setJk_startPoint:(CGPoint)startPoint{
    
    objc_setAssociatedObject(self, @selector(jk_startPoint), [NSValue valueWithCGPoint:startPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setStartPoint:self.jk_startPoint];
    }
}


- (CGPoint)jk_endPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setJk_endPoint:(CGPoint)endPoint {
    objc_setAssociatedObject(self, @selector(jk_endPoint), [NSValue valueWithCGPoint:endPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setEndPoint:self.jk_endPoint];
    }
}

/**-----------**/

- (UIImage *)jk_snapshotImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

-(UIImage *)jk_snapshotImageSize:(CGSize)pitureSize
{
    //1.开启一个和传进来的View大小一样的位图上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,NO,0);
    //2.把控制器的View绘制到上下文当中
    //想把UIView上面的东西绘制到上下文当中,必须得使用渲染的方式
    //renderInContext:就是渲染的方式
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx ];
    
    //3从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsBeginImageContext(CGSizeMake(pitureSize.width, pitureSize.height));
    [newImage drawInRect:CGRectMake(0, 0, pitureSize.width, pitureSize.height)];
    
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭上下文
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

-(void)jk_snapshotImageSizePath:(NSString *)path withPicturetype:(NSString *)type withSize:(CGSize)pitureSize
{
    //1.开启一个和传进来的View大小一样的位图上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,NO,0);
    //2.把控制器的View绘制到上下文当中
    //想把UIView上面的东西绘制到上下文当中,必须得使用渲染的方式
    //renderInContext:就是渲染的方式
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    
    [self.layer renderInContext:ctx ];
    
    //3从上下文当中生成一张图片
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsBeginImageContext(CGSizeMake(pitureSize.width, pitureSize.height));
    
    [newImage drawInRect:CGRectMake(0, 0, pitureSize.width, pitureSize.height)];
    
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭上下文
    UIGraphicsEndImageContext();
    
    //5.把生成的图片写入到桌面(以文件的方式进行传输:二进制流NSData,即把图片转为二进制流)
    NSData *data;
    
    if ([type isEqualToString:@"png"]) {
        
        //生成PNG格式的图片
        data = UIImagePNGRepresentation(reSizeImage);
        
    }else if ([type isEqualToString:@"jpg"]){
        
        //5.1把图片转为二进制流(第一个参数是图片,第2个参数是图片压缩质量:1是最原始的质量)
        data = UIImageJPEGRepresentation(reSizeImage,1);
    }
    
    [data writeToFile:path atomically:YES];
    
}

-(UIImage *)testCgrect:(CGRect)rect{
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 1);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *resultImg = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(img.CGImage, rect)];
    UIGraphicsEndImageContext();
    
    return resultImg;
}

// 通过 CAShapeLayer 方式绘制虚线
-(void)jk_drawLineOfDashByCAShapeLayerLineWidth:(int)lineWidth withLineSpacing:(int)lineSpacing withLineColor:(UIColor *)lineColor withLineDirection:(BOOL)isHorizonal{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setBounds:self.bounds];
    
    if (isHorizonal) {
        
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame))];
        
    } else{
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame)/2)];
    }
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    if (isHorizonal) {
        [shapeLayer setLineWidth:CGRectGetHeight(self.frame)];
    } else {
        
        [shapeLayer setLineWidth:CGRectGetWidth(self.frame)];
    }
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineWidth], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    
    if (isHorizonal) {
        CGPathAddLineToPoint(path, NULL,CGRectGetWidth(self.frame), 0);
    } else {
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(self.frame));
    }
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [self.layer addSublayer:shapeLayer];
}

- (void)addShadowAndCornerSuperView:(UIView *)superView roundRectCorner:(UIRectCorner)corners withCornerRadius:(CGFloat)cornerRadius shadowRadius:(CGFloat)shadowRadius shadowColor:(UIColor *)shadowColor withShadowOffset:(CGSize)offset withShadowOpacity:(float)opacity {
    // 切圆角
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
    
    // 阴影
    CALayer *subLayer=[CALayer layer];
    CGRect fixframe = self.frame;
    subLayer.frame= fixframe;
    subLayer.cornerRadius = shadowRadius;
    subLayer.backgroundColor=[shadowColor colorWithAlphaComponent:0.8].CGColor;
    subLayer.masksToBounds = NO;
    // shadowColor阴影颜色
    subLayer.shadowColor = [UIColor blackColor].CGColor;
    // shadowOffset阴影偏移,x向右偏移3，y向下偏移2，默认(0, -3),这个跟shadowRadius配合使用
    subLayer.shadowOffset = offset;
    // 阴影透明度，默认0
    subLayer.shadowOpacity = opacity;
    // 阴影半径，默认3
    subLayer.shadowRadius = shadowRadius;
    [superView.layer insertSublayer:subLayer below: self.layer];
}


@end
