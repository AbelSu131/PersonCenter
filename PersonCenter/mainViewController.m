//
//  mainViewController.m
//  PersonCenter
//
//  Created by abel on 15/9/17.
//  Copyright © 2015年 abel. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *personalTableView;
    NSArray *dataSource;
}

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    personalTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:personalTableView];
    personalTableView.dataSource = self;
    personalTableView.delegate = self;
    personalTableView.bounces = NO;//yes，就是滚动超过边界会反弹有反弹回来的效果; NO，那么滚动到达边界会立刻停止。
    personalTableView.showsVerticalScrollIndicator = NO;//不显示右侧滑块
    personalTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;//分割线
    dataSource = @[@"我的分享",@"密码管理",@"用户协议",@"关于"];
}

#pragma mark - TbaleView的数据源代理方法实现
//返回组数的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
//返回行数的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0){
        return 1;
    }else if (section==1){
        return dataSource.count;
    }else{
        return 1;
    }
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==2){
        return 40;
    }
    return 20;
}
//每个分组下对应的tableView高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 80;
    }
    return 40;
}
//返回每一行Cell的代理方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1 初始化Cell
    // 1.1 设置Cell的重用标识
    static NSString *ID = @"cell";
    // 1.2 去缓存池中取Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 1.3 若取不到便创建一个带重用标识的Cell
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.section==0) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 10, 60, 60)];
        imageView.image = [UIImage imageNamed:@"1578945"];
        [cell.contentView addSubview:imageView];
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 60, 80)];
        nameLabel.text = @"小燕子";
        [cell.contentView addSubview:nameLabel];
        
    }else if (indexPath.section==1){
        cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
        //设置Cell右边的小箭头
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else{
        cell.textLabel.text = @"退出登录";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    //设置Cell右边的小箭头
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
