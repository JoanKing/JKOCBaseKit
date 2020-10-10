//
//  JKImageLayerViewController.m
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/5/14.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import "JKImageLayerViewController.h"

@interface JKImageLayerViewController ()

@end

@implementation JKImageLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"高性能圆角";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    UIImage *image = [[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://tupian.qqjay.com/tou2/2017/0716/beda02b062d69c0eae40318f38aab6d1.jpg"]]] circleImage];
    imageView.image = image;
    [self.view addSubview:imageView];
    
}

@end
