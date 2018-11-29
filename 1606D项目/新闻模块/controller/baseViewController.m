//
//  baseViewController.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "baseViewController.h"
#import"basecell.h"
#import"basemodel.h"
#import "NewxiangqingViewController.h"
#import "UIView+ThemeChange.h"
#import "UILabel+ThemeChange.h"
@interface baseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *datasource;

@end

@implementation baseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据源
    [self initdata];

    [self.view addSubview:self.tableview];
    //添加下拉刷新
    [self addheaderrefresh];
    //上拉加载
    [self addfooterrefresh];
    //请求数据
    [self setmyurl];
    [self loaddata];
[self.view NightWithType:UIViewColorTypeNormal];
}

#pragma mark - 初始化数据
-(void)initdata{
    self.datasource=[NSMutableArray array];
    //初始化页数
    self.page=1;
}

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview=[[UITableView alloc]initWithFrame:self.view.frame];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        _tableview.backgroundColor = UIViewColorTypeNormal;
        //注册单元格
        [_tableview registerNib:[UINib nibWithNibName:@"basecell" bundle:nil] forCellReuseIdentifier:@"celll"];
    }
    
    return _tableview;
}

#pragma mark - 添加头部刷新
-(void)addheaderrefresh{
    MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingBlock:^{
        //刷新的回调
        //重置页数
        self.page=1;
        //清空数据源
        [self.datasource removeAllObjects];
        //重新发送网络请求
        [self setmyurl];
        [self loaddata];
    }];
    NSArray * imageArr = @[[UIImage imageNamed:@"common_loading_anne_0"],[UIImage imageNamed:@"common_loading_anne_1"]];
    //添加正在刷新中的状态
    [header setImages:imageArr forState:MJRefreshStateRefreshing];
    //闲置状态
    [header setImages:@[[UIImage imageNamed:@"common_loading_anne_0"]] forState:MJRefreshStateIdle];
    //文字
    [header setTitle:@"马上完成..." forState:MJRefreshStateRefreshing];
    self.tableview.mj_header=header;
    
}

#pragma mark - 上拉加载
-(void)addfooterrefresh{
    MJRefreshAutoGifFooter *footer=[MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        //页面增加
        self.page++;
        //重新请求数据
        [self setmyurl];
        [self loaddata];
    }];
    NSArray * imageArr = @[[UIImage imageNamed:@"common_loading_anne_0"],[UIImage imageNamed:@"common_loading_anne_1"]];
    [footer setImages:imageArr forState:MJRefreshStateRefreshing];
    self.tableview.mj_footer=footer;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    basecell *cell=[tableView dequeueReusableCellWithIdentifier:@"celll"];
    if (self.datasource.count>0) {
        basemodel *model=self.datasource [indexPath.row];
        [cell loadDataFromModel:model];
    }
    cell.backgroundColor = UIViewColorTypeNormal;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

//设置网址
-(void)setmyurl{
    self.url=TOUTIAO_PATH;
    self.Key=TOUTIAO_KEY;
}

//请求数据
-(void)loaddata{
    //显示加载栏
    [SVProgressHUD showWithStatus:@"加载中..."];
    //创建网络请求
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    //设置默认请求类型（NSData）
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:self.url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //解析数据
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *resultarr=dic[self.Key];
        for (NSDictionary *dicc in resultarr) {
            //封装model,建立数据模型
            basemodel *model=[[basemodel alloc]init];
            [model setValuesForKeysWithDictionary:dicc];
            [self.datasource addObject:model];
        }
        [self.tableview reloadData];
        //取消刷新控件
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
        //去掉加载栏
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //提示用户
        
        //取消刷新控件
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
        //去掉加载栏
        [SVProgressHUD dismiss];
    }];
}
//点击跳转详情
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //去掉选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //跳转界面
    NewxiangqingViewController *detail=[[NewxiangqingViewController alloc] init];
    
    //隐藏标签栏控制器
    detail.hidesBottomBarWhenPushed=YES;
    
    
    //获取点中单元格的详情url
    basemodel *model=self.datasource[indexPath.row];
    
    detail.urlstring=model.url;
    
    [self.navigationController pushViewController:detail animated:YES];
    
}

@end
