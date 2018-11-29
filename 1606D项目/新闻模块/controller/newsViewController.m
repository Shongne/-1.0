//
//  newsViewController.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "newsViewController.h"
#import "toutiaoViewController.h"
#import "yuleViewController.h"
#import "tiyuViewController.h"
#import "caijingViewController.h"
#import "kejiViewController.h"
#import "gentieViewController.h"
#import "qingsongyikeViewController.h"

#import "SCNavTabBarController.h"  //三方文件
@interface newsViewController ()

@end

@implementation newsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //主题 SCNav
    [self createscnav];
}

-(void)createscnav{
    //创建视图控制器
    toutiaoViewController * toutiao = [[toutiaoViewController alloc]init];
    toutiao.title = @"头条";
    yuleViewController * yule = [[yuleViewController alloc]init];
    yule.title = @"娱乐";
    tiyuViewController * tiyu = [[tiyuViewController alloc]init];
    tiyu.title = @"体育";
    caijingViewController * caijing = [[caijingViewController alloc]init];
    caijing.title = @"财经";
    kejiViewController * keji = [[kejiViewController alloc]init];
    keji.title = @"科技";
    gentieViewController * gentie = [[gentieViewController alloc]init];
    gentie.title = @"跟帖";
    qingsongyikeViewController * qingsong = [[qingsongyikeViewController alloc]init];
    qingsong.title = @"轻松一刻";
    
    //1、创建SCNavTabBar
    SCNavTabBarController * scNav = [[SCNavTabBarController alloc]init];
    //2、进行管理所需展示视图
    scNav.subViewControllers =[NSMutableArray arrayWithArray: @[toutiao,yule,tiyu,caijing,keji,gentie,qingsong]];
    //更改导航栏位置颜色
    [scNav setNavTabBarColor:[UIColor blackColor]];
    //3、执行管理
    [scNav addParentController:self];
}
//隐藏系统导航栏
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];//调用父类方法
    self.navigationController.navigationBarHidden = YES;
    //更改状态栏样式
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];//调用父类方法
    self.navigationController.navigationBarHidden = NO;
}
@end
