//
//  gentieViewController.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "gentieViewController.h"

@interface gentieViewController ()

@end

@implementation gentieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//重写父类方法
-(void)setmyurl{
    self.Key=GENTIE_KEY;
    self.url=GENTIE_PATH;
    
}

@end
