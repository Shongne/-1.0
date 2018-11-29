//
//  videoViewController.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "videoViewController.h"
#import "VideoTableViewCell.h"
#import "videomodel.h"
#import "PlayvideoViewController.h"
#import "UIView+ThemeChange.h"
#import "UILabel+ThemeChange.h"
@interface videoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableview;
@property(nonatomic,strong) NSMutableArray *datasource;
@end

@implementation videoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //标题
    
    self.title=@"视频";
    
    //初始化数据源
    self.datasource=[NSMutableArray new];
    //表格添加到视图
    [self.view addSubview:self.tableview];
    //加载数据
    [self loaddata];
    [self.view NightWithType:UIViewColorTypeNormal];
    //添加刷新方法
    [self addfooterrefresh];
    [self addheaderrefresh];
}
-(void)loaddata{
    //显示加载栏
    [SVProgressHUD showWithStatus:@"加载中..."];
    //创建网络请求
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    //设置默认请求类型（NSData）
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //数据请求
    [manager GET:VIDEO_PATH parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //解析数据
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *resultarr=dic[@"V9LG4B3A0"];
        
        for (NSDictionary *dicc in resultarr) {
            //封装model,建立数据模型
            videomodel *model=[[videomodel alloc]init];
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
#pragma mark - 添加头部刷新
-(void)addheaderrefresh{
    MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingBlock:^{
        //刷新的回调
        //重置页数
       // self.page=1;
        //清空数据源
        [self.datasource removeAllObjects];
        //重新发送网络请求
       // [self setmyurl];
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
       // self.page++;
        //重新请求数据
        //[self setmyurl];
        [self loaddata];
    }];
    NSArray * imageArr = @[[UIImage imageNamed:@"common_loading_anne_0"],[UIImage imageNamed:@"common_loading_anne_1"]];
    [footer setImages:imageArr forState:MJRefreshStateRefreshing];
    self.tableview.mj_footer=footer;
}




-(UITableView *)tableview {
    
    if(!_tableview) {
        
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableview.delegate =self;
        
        _tableview.dataSource =self;
        
        [_tableview registerNib:[UINib nibWithNibName:@"VideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
         _tableview.backgroundColor = UIViewColorTypeNormal;
    }

    return _tableview;
}
#pragma mark--数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(self.datasource.count>0){
        
        [cell loadDataFromModel:self.datasource[indexPath.row]];
    }
     cell.backgroundColor = UIViewColorTypeNormal;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}

//传值
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //去掉选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //跳转界面
    PlayvideoViewController *detail=[[PlayvideoViewController alloc] init];
    
    //隐藏标签栏控制器
     detail.hidesBottomBarWhenPushed = YES;
    
    //获取点中单元格的详情url
    videomodel *model=self.datasource[indexPath.row];
    
    detail.mp4url=model.mp4_url;
    
    [self.navigationController pushViewController:detail animated:YES];
    
}
@end
