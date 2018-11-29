//
//  MeViewController.m
//  1606D项目
//
//  Created by 孙洪恩 on 2018/11/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "MeViewController.h"
#import "ThemeManage.h"
#import "UIView+ThemeChange.h"
#import "UILabel+ThemeChange.h"
#import "twoViewController.h"
#import "TXAdapter.h"
#import "UIView+ThemeChange.h"
#import "UILabel+ThemeChange.h"
@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableview;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.view addSubview:self.tableview];
    [self.view NightWithType:UIViewColorTypeNormal];
    UIImage *barButtonImage = [ThemeManage shareThemeManage].isNight ? [UIImage imageNamed:@"night"] : [UIImage imageNamed:@"day"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:barButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnAction:)];
    
}
- (void)rightBarBtnAction:(UIBarButtonItem *)barButton {
    
    [ThemeManage shareThemeManage].isNight = ![ThemeManage shareThemeManage].isNight;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil];
    [[NSUserDefaults standardUserDefaults] setBool:[ThemeManage shareThemeManage].isNight forKey:@"night"];
    UIImage *barBtnImage = [ThemeManage shareThemeManage].isNight ? [UIImage imageNamed:@"night"] : [UIImage imageNamed:@"day"];
    [barButton setImage:barBtnImage];
}
- (void)dealloc {
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, -35, self.view.frame.size.width, self.view.frame.size.height+35) style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = UIViewColorTypeNormal;
    }
    return _tableview;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        
        return 1;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 3;
    }else if (section == 3){
        return 2;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //    if (cell == nil) {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    //    }
    //   UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if (indexPath.section == 0) {
        //第一分区
        _tableview.rowHeight = 200;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(110, 20, tRealLength(150), tRealLength(150))];
        [btn setImage:[UIImage imageNamed:@"denglu"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick) forControlEvents:(UIControlEventTouchUpInside)];
        [cell addSubview:btn];
        
    }else if(indexPath.section == 1){
        //第二分区
        _tableview.rowHeight = 133;
        for (int i = 0 ; i < 4; i ++) {
            UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(i*100, 20, tRealLength(90), tRealLength(90))];
            NSArray *imgArr = @[@"1",@"2",@"3",@"4"];
            [btn1 setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
            [cell addSubview:btn1];
            
            UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(i*100, 25, 150, 150)];
            NSArray *Arr = @[@"我的收藏",@"我的评论",@"我的点赞",@"浏览历史"];
            //btn2.backgroundColor = [UIColor redColor];
            [btn2 setTitle:Arr[i] forState:UIControlStateNormal];
            [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [cell addSubview:btn2];
            
        }
    }else if(indexPath.section == 2){
        //第三分区
        _tableview.rowHeight = 50;
        if(indexPath.row == 0){
            //第三分区第一行
            cell.textLabel.text = @"我的关注";
            cell.detailTextLabel.text = @">";
        }else if ( indexPath.row== 1){
            //第三分区第二行
            cell.textLabel.text = @"消息通知";
            cell.detailTextLabel.text = @">";
        }else{
            cell.textLabel.text = @"阅读公益";
            cell.detailTextLabel.text = @"今日阅读21分钟>";
            //第三分区第三行
        }
    }else if (indexPath.section == 3){
        //第四分区
        _tableview.rowHeight = 60;
        if(indexPath.row == 0){
            cell.textLabel.text = @"我的钱包";
            cell.detailTextLabel.text = @"手机充值>";
            //第四分区第一行
        }else{
            cell.textLabel.text = @"京东特供";
            cell.detailTextLabel.text = @"新人领188元红包>";
            ////第四分区第一行
        }
    }else{
        _tableview.rowHeight = 60;
        //第五分区
        if(indexPath.row == 0){
            cell.textLabel.text = @"用户反馈";
            cell.detailTextLabel.text = @">";
            //第五分区第一行
        }else{
            cell.textLabel.text = @"系统设置";
            cell.detailTextLabel.text = @">";
            //第五分区第二行
        }
    }
    
    cell.backgroundColor = UIViewColorTypeNormal;
    
    return cell;
}
-(void)buttonClick {
    twoViewController *vc2=[[twoViewController alloc] init];
    //[self presentModalViewController:vc2 animated:YES];
    [self.navigationController pushViewController:vc2 animated:YES];
    
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    return view;
}
@end
