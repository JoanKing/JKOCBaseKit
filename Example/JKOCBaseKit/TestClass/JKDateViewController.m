//
//  JKDateViewController.m
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/5/9.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import "JKDateViewController.h"

@interface JKDateViewController ()

@end

@implementation JKDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
    NSLog(@"时间戳=%ld",(long)[JKDate jk_cTimestampFromString:@"2019 05-10" format:@"yyyy MM-dd"]);
    NSLog(@"时间：2019 05-10 13:45 转换成时间戳为 =%ld",(long)[JKDate jk_cTimestampFromString:@"2019 05-10 8:13:45" format:@"yyyy MM-dd HH:mm:ss"]);
    
}

-(void)test{
   
    
    NSLog(@"当天零点的时间戳=%ld",[JKDate getTodayZeroTimeStamp]);
    NSLog(@"当天24点的时间戳=%ld",[JKDate getTodayZeroTimeStamp]+24*3600);
    
    NSLog(@"本周周一零点的时间戳=%ld",[JKDate getNowWeekMondayZeroTimeStamp]);
    
    NSLog(@"本月1号零点的时间戳=%ld",[JKDate getNowMonthOneDayZeroTimeStamp]);
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[@"1557370800" longLongValue]];
    
    NSLog(@"本月1号零点的时间戳=%ld",(long)[JKDate getTimeStamp:date]);
    
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
