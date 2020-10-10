//
//  ConstellationViewController.m
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/5/31.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import "ConstellationViewController.h"

@interface ConstellationViewController ()
{
    UIImageView *navBarHairlineImageView;
}
@end

@implementation ConstellationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
 
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"星座测试";
    
    NSString *myConstellation = [JKDate jk_calculateConstellationWithMonth:2 day:2];
    NSLog(@"我的星座是：%@",myConstellation);

    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
}

//通过一个方法来找到这个黑线(findHairlineImageViewUnder):
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

// 同样的在界面出现时候开启隐藏
-(void)viewWillAppear:(BOOL)animated
{
    navBarHairlineImageView.hidden = YES;
}
//在页面消失的时候就让出现
-(void)viewDidDisappear:(BOOL)animated
{
    navBarHairlineImageView.hidden = NO;
}

/**
 如果想要做一些更好的处理,比如说改变粗细,颜色之类的也在界面出现的时候写就行了.
 推荐使用第二种方法,因为整个项目都在使用导航栏推栈,出栈,很可能因为改变了样式,导致后面的属性混乱起来.
 */


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
