//
//  NewxiangqingViewController.m
//  1606D项目
//
//  Created by 王克杨的Mac on 2018/10/8.
//  Copyright © 2018年 zhangjiliang. All rights reserved.
//

#import "NewxiangqingViewController.h"
#import<WebKit/WebKit.h>
#import "UIView+ThemeChange.h"
#import "UILabel+ThemeChange.h"
@interface NewxiangqingViewController ()

@end

@implementation NewxiangqingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view NightWithType:UIViewColorTypeNormal];
    // Do any additional setup after loading the view.
    //关闭导航条半透明
    self.navigationController.navigationBar.translucent=NO;
//    视图背景色
    self.view.backgroundColor=[UIColor whiteColor];
    
    //网页视图  ios2  摒弃了uiweb
    WKWebView *webview=[[WKWebView alloc] initWithFrame:CGRectMake(0, -64, WIDTH, HEIGHT+64+49)];
    //将传过来的urlstring 转化为url
    [webview NightWithType:UIViewColorTypeNormal];
    NSURL *url=[NSURL URLWithString:self.urlstring];
    
    //创建请求对象
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    //网页加载网页
    [webview loadRequest:request];
    //添加到当前视图
    [self.view addSubview:webview];
}



@end
