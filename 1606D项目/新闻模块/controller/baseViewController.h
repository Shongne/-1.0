//
//  baseViewController.h
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface baseViewController : UIViewController
//网址
@property(nonatomic,strong)NSString *url;
//key
@property(nonatomic,strong)NSString *Key;
//当前页
@property(nonatomic,assign)int page;
//设置我的url
-(void)setmyurl;
//数据请求
-(void)loaddata;
@end

NS_ASSUME_NONNULL_END
