//
//  tiyuViewController.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "tiyuViewController.h"

@interface tiyuViewController ()

@end

@implementation tiyuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//重写父类方法
-(void)setmyurl{
    self.Key=TIYU_KEY;
    self.url=TIYU_PATH;
    
}

@end
