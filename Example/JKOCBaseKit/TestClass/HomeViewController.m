//
//  HomeViewController.m
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/9/17.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import "HomeViewController.h"

#import "TestViewController.h"
#import "RSATestViewController.h"
// 有关日期的使用
#import "DateViewController.h"
// MD5加密
#import "MD5TestViewController.h"
// 二维码生成以及扫描的测试
#import "JKQRCodeTestViewController.h"
// 根据银行卡号取银行的名字
#import "JKBankNameViewController.h"
// BundleSource 资源文件的测试
#import "JKBundleSourceViewController.h"
// 可点击标签的添加
#import "JKSmallLabelViewController.h"
// 时间戳测试
#import "JKDateViewController.h"
// 高性能圆角
#import "JKImageLayerViewController.h"
// 星座测试
#import "ConstellationViewController.h"
// tableview 的相关测试
#import "JKTableViewController.h"
//震动
#import "JKImpactFeedbackGeneratorViewController.h"
//颜色的测试
#import "JKColorViewController.h"
//tableview的测试
#import "JKTableViewViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"IMBaseKit";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([UIDevice isPhoneSupported]) {
        
        NSLog(@"支持");
    }else{
        NSLog(@"不支持");
    }
    
    [self.dataArray addObjectsFromArray:@[@"最初的测试",@"RSA加密的使用",@"有关日期的使用",@"MD5加密",@"二维码生成以及扫描的测试",@"根据银行卡号取银行的名字",@"Bundle资源文件的测试",@"可点击标签的添加",@"时间戳测试",@"高性能圆角",@"星座测试",@"tableview 的相关测试",@"震动",@"颜色的测试",@"tableview的测试"]];
    
    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld、 %@",indexPath.row,self.dataArray[indexPath.row]];
    cell.backgroundColor = JKRandomColor;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44+JKstatusBarHeight, JK_SCREEN_WIDTH, JK_SCREEN_HEIGHT-44-JKstatusBarHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            
        } else {
            // 小于11.0的不做操作
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    
    return _tableView;
}

-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    
    return _dataArray;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cell_name = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    if ([cell_name isEqualToString:@"最初的测试"]) {
        
        TestViewController *testViewController = [TestViewController new];
        [self.navigationController pushViewController:testViewController animated:YES];
        
    }else if ([cell_name isEqualToString:@"RSA加密的使用"]){
        
        RSATestViewController *rsaTestViewController = [RSATestViewController new];
        [self.navigationController pushViewController:rsaTestViewController animated:YES];
    }else if ([cell_name isEqualToString:@"有关日期的使用"])
    {
        
        DateViewController *dateViewController = [DateViewController new];
        [self.navigationController pushViewController:dateViewController animated:YES];
    }else if([cell_name isEqualToString:@"MD5加密"]){
        
        MD5TestViewController *md5TestViewController = [MD5TestViewController new];
        [self.navigationController pushViewController:md5TestViewController animated:YES];
    }else if ([cell_name isEqualToString:@"二维码生成以及扫描的测试"]){
        
        JKQRCodeTestViewController *md5TestViewController = [JKQRCodeTestViewController new];
        [self.navigationController pushViewController:md5TestViewController animated:YES];
    }else if ([cell_name isEqualToString:@"根据银行卡号取银行的名字"]){
        
        JKBankNameViewController *jkBankNameViewController = [JKBankNameViewController new];
        [self.navigationController pushViewController:jkBankNameViewController animated:YES];
    }else if ([cell_name isEqualToString: @"Bundle资源文件的测试"]){
        
        JKBundleSourceViewController *jkBundleSourceViewController = [JKBundleSourceViewController new];
        [self.navigationController pushViewController:jkBundleSourceViewController animated:YES];
    }else if ([cell_name isEqualToString:@"可点击标签的添加"]){
        
        JKSmallLabelViewController *jkSmallLabelViewController = [JKSmallLabelViewController new];
        [self.navigationController pushViewController:jkSmallLabelViewController animated:YES];
    }else if ([cell_name isEqualToString:@"时间戳测试"]){
        
        JKDateViewController *dateViewController = [JKDateViewController new];
        [self.navigationController pushViewController:dateViewController animated:YES];
    }else if ([cell_name isEqualToString:@"高性能圆角"]){
        
        JKImageLayerViewController *jkImageLayerViewController = [JKImageLayerViewController new];
        [self.navigationController pushViewController:jkImageLayerViewController animated:YES];
    }else if ([cell_name isEqualToString:@"星座测试"]){
        
        ConstellationViewController *constellationViewController = [ConstellationViewController new];
        [self.navigationController pushViewController:constellationViewController animated:YES];
    }else if ([cell_name isEqualToString:@"tableview 的相关测试"]){
        
        JKTableViewController *tableViewController = [JKTableViewController new];
        [self.navigationController pushViewController:tableViewController animated:YES];
    }else if ([cell_name isEqualToString:@"震动"]){
        
        JKImpactFeedbackGeneratorViewController *impactFeedbackGeneratorViewController = [JKImpactFeedbackGeneratorViewController new];
        [self.navigationController pushViewController:impactFeedbackGeneratorViewController animated:YES];
    }else if ([cell_name isEqualToString:@"颜色的测试"]){
        JKColorViewController *colorViewController = [JKColorViewController new];
        [self.navigationController pushViewController:colorViewController animated:YES];
    }else if ([cell_name isEqualToString:@"tableview的测试"]){
        JKTableViewViewController *tableViewViewController = [JKTableViewViewController new];
        [self.navigationController pushViewController:tableViewViewController animated:YES];
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}


@end
