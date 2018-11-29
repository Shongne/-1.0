//
//  jokeViewController.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "jokeViewController.h"
#import "jokeTableViewCell.h"
#import "jokemodel.h"
#import "UIView+ThemeChange.h"
#import "UILabel+ThemeChange.h"
@interface jokeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableview;
@property(nonatomic,strong) NSMutableArray *datasource;
@property(nonatomic,strong) NSMutableArray *heightarray;
@end

@implementation jokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datasource=[[NSMutableArray alloc] init];
    self.heightarray=[[NSMutableArray alloc] init];
    [self.view addSubview:self.tableview];
    [self.view NightWithType:UIViewColorTypeNormal];
    [self loaddata];
}
- (void)dealloc {
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)loaddata{
    
    //显示加载栏
    [SVProgressHUD showWithStatus:@"加载中..."];
    //创建网络请求
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    //设置默认请求类型（NSData）
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //数据请求
    [manager GET:JOKE_PATH parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //解析数据
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *resultarr=dic[@"段子"];
        
        for (NSDictionary *dicc in resultarr) {
           
           [ self.datasource addObject:dicc[@"title"]];
            
            //计算单元格的高度  根据lab  显示的字体大小跟字体样式来计算
            
//            @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]};
            
            
            CGSize size=[dicc[@"title"]boundingRectWithSize:CGSizeMake(WIDTH-40, 1000) options:1 attributes: @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]} context:nil].size;
            
            [self.heightarray addObject:@(size.height+40)];
            
        }
        
        [self.tableview reloadData];
        //取消刷新控件
//         [self.tableview.mj_header endRefreshing];
//        [self.tableview.mj_footer endRefreshing];
        //去掉加载栏
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //提示用户
        //取消刷新控件
//        [self.tableview.mj_header endRefreshing];
//        [self.tableview.mj_footer endRefreshing];
        //去掉加载栏
        [SVProgressHUD dismiss];
    }];
}

-(UITableView *)tableview {
    
    if(!_tableview) {
        
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableview.delegate =self;
        
        _tableview.dataSource =self;
        [_tableview registerNib:[UINib nibWithNibName:@"jokeTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
       // _tableview.backgroundColor = [UIColor whiteColor];
        _tableview.backgroundColor = UIViewColorTypeNormal;
    }
    
    return _tableview;
    
}

#pragma mark--数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   jokeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (self.datasource.count>0) {
        cell.titlelable.text=self.datasource[indexPath.row];
    }
    cell.backgroundColor = UIViewColorTypeNormal;
   // cell.backgroundColor = [UIColor whiteColor];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [_heightarray[indexPath.row] integerValue];
}

@end
