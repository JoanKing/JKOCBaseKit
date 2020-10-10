//
//  JKTableViewController.m
//  IMBaseKitDemo
//
//  Created by 王冲 on 2019/7/5.
//  Copyright © 2019 JK科技有限公司. All rights reserved.
//

#import "JKTableViewController.h"
#import "Test3ViewController.h"
@interface JKTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation JKTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"tableVie";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.openCellAndHeaderAnimateWhenScroll = YES;
    
    [self.view addSubview:self.tableView];
    
    [self.dataArray addObjectsFromArray:@[@"最初的测试",@"RSA加密的使用",@"有关日期的使用",@"MD5加密",@"二维码生成以及扫描的测试",@"根据银行卡号取银行的名字",@"Bundle资源文件的测试",@"可点击标签的添加",@"时间戳测试",@"高性能圆角",@"星座测试",@"tableview 的相关测试"]];
    
    [self.tableView reloadData];
  
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
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, JK_SCREEN_WIDTH, JK_SCREEN_HEIGHT-44-JKstatusBarHeight) style:UITableViewStylePlain];
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
    
    
    
  
    
}

@end

