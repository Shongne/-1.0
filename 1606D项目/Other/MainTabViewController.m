//
//  MainTabViewController.m
//  1606D项目
//
//  Created by 张继良 on 2018/9/27.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "MainTabViewController.h"
#import "ThemeManage.h"
#import "UIView+ThemeChange.h"
@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建标签控制器
    [self createtabbar];
}
#pragma mark--标签控制器
-(void)createtabbar{
    
    [self.view NightWithType:UIViewColorTypeNormal];
    //控制器的名称 数组
    NSArray *array=@[@"newsViewController",@"videoViewController",@"pictureViewController",@"jokeViewController",@"MeViewController"];
//    控制器名字图片
    NSArray *unselectimagearray=@[@"新闻",@"视频",@"图片",@"段子",@"我的"];
    NSArray *selectimagearray=@[@"新闻1",@"视频1",@"图片1",@"段子1",@"我的1"];
    //控制器数组
    NSMutableArray *viewcontrollerarray=[NSMutableArray new];
    //根据控制器的名称创建相应的控制器 并添加到控制器的数组里
    for (int i=0; i<array.count; i++) {
        //字符串来创建控制器   string->controller
        UIViewController *vc=[[NSClassFromString(array[i]) alloc]init];
        //添加导航控制器
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
        //设置Tabbaritem的  选中图片 未选中图片 标题
        nav.tabBarItem.image=[[UIImage imageNamed:unselectimagearray[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage=[[UIImage imageNamed:selectimagearray[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.title=unselectimagearray[i];
       [nav.navigationBar NightWithType:UIViewColorTypeNormal];
      //  nav.navigationBar.barTintColor=[UIColor blackColor];
        //添加到数组里
        [viewcontrollerarray addObject:nav];
    }
    self.viewControllers=viewcontrollerarray;
}

@end
