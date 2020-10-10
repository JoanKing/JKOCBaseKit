//
//  JKImpactFeedbackGeneratorViewController.m
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/7/31.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import "JKImpactFeedbackGeneratorViewController.h"

@interface JKImpactFeedbackGeneratorViewController ()

@end

@implementation JKImpactFeedbackGeneratorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"震动点击" forState:0];
    [button setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:button];
}

- (void)click {
    
    //震动一下
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [feedBackGenertor impactOccurred];
    }
    
    NSLog(@"点击测试");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
