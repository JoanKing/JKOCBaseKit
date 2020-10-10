//
//  JKColorViewController.m
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/9/2.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import "JKColorViewController.h"
#import "NSAttributedString+Extension.h"
#define kRedColor06 @"f44336"
#define KGRAYCOLOR13 @"8f91a4"
@interface JKColorViewController ()

@end

@implementation JKColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, JK_SCREEN_WIDTH-40, 40)];
    label1.attributedText = [NSMutableAttributedString cy_attributeFirstString:@"第一段文字" withFirstTextColor:[UIColor redColor] withSecondString:@"第二段文字" withSecondTextColor:[UIColor brownColor] withFont:[UIFont systemFontOfSize:18]];
    [self.view addSubview:label1];
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
