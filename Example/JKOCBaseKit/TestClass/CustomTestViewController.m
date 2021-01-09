//
//  CustomTestViewController.m
//  JKOCBaseKit_Example
//
//  Created by IronMan on 2020/11/6.
//  Copyright © 2020 JoanKing. All rights reserved.
//

#import "CustomTestViewController.h"

@interface CustomTestViewController ()

@end

@implementation CustomTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *v=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    v.backgroundColor = [UIColor yellowColor];
    //v.layer.masksToBounds=YES;这行去掉
    v.layer.cornerRadius=10;
    v.layer.shadowColor=[UIColor redColor].CGColor;
    v.layer.shadowOffset=CGSizeMake(1, 1);
    v.layer.shadowOpacity=0.5;
    v.layer.shadowRadius=5;
    [self.view addSubview:v];
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
