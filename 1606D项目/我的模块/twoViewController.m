//
//  twoViewController.m
//  1606D项目
//
//  Created by pxy on 2018/11/29.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "twoViewController.h"
#import "TXAdapter.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import "UIView+ThemeChange.h"
#import "UILabel+ThemeChange.h"
@interface twoViewController ()
{
    UIButton *wbbtn;
    UIButton *wxbtn;
    UIButton *qqbtn;
}
@end

@implementation twoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    wbbtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 500, tRealLength(100), tRealLength(100))];
    self.view.backgroundColor = [UIColor whiteColor];
    [wbbtn setImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
    //[wbbtn setBackgroundColor:[UIColor redColor]];
    [wbbtn addTarget:self action:@selector(weibo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wbbtn];
    
    wxbtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 500, tRealLength(100), tRealLength(100))];
    [wxbtn setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    //[wxbtn setBackgroundColor:[UIColor redColor]];
    [wxbtn addTarget:self action:@selector(weixin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wxbtn];
    
    qqbtn = [[UIButton alloc] initWithFrame:CGRectMake(250, 500, tRealLength(100), tRealLength(100))];
    [qqbtn setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
    //[qqbtn setBackgroundColor:[UIColor redColor]];
    [qqbtn addTarget:self action:@selector(qq) forControlEvents:UIControlEventTouchUpInside];
     [self.view NightWithType:UIViewColorTypeNormal];
    [self.view addSubview:qqbtn];
    
}
- (void)weibo{
    NSArray* imageArray = @[[UIImage imageNamed:@"1.png"]];
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //有的平台要客户端分享需要加此方法，例如微博
        [shareParams SSDKEnableUseClientShare];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}
}

- (void)weixin{
    
    [ShareSDK authorize:       SSDKPlatformTypeWechat         settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess)
        {
            NSLog(@"%@",user.rawData);
            NSLog(@"uid===%@",user.uid);
            NSLog(@"%@",user.credential);
        }
        else if (state == SSDKResponseStateCancel)
        {
            NSLog(@"取消");
        }
        else if (state == SSDKResponseStateFail)
        {
            NSLog(@"%@",error);
        }
    }];
}

- (void)qq{
    
    [ShareSDK authorize:       SSDKPlatformTypeQQ        settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess)
        {
            NSLog(@"%@",user.rawData);
            NSLog(@"uid===%@",user.uid);
            NSLog(@"%@",user.credential);
        }
        else if (state == SSDKResponseStateCancel)
        {
            NSLog(@"取消");
        }
        else if (state == SSDKResponseStateFail)
        {
            NSLog(@"%@",error);
        }
    }];
}



@end
