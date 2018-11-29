//
//  toutiaoViewController.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "toutiaoViewController.h"

@interface toutiaoViewController ()

@end

@implementation toutiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor yellowColor];
}
//重写父类方法
-(void)setmyurl{
    self.Key=TOUTIAO_KEY;
    self.url=TOUTIAO_PATH;
    
}


@end
