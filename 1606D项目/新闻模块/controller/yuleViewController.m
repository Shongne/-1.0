//
//  yuleViewController.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "yuleViewController.h"

@interface yuleViewController ()

@end

@implementation yuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
}

//重写父类方法
-(void)setmyurl{
    self.Key=YULE_KEY;
    self.url=YULE_PATH;
    
}

@end
