//
//  kejiViewController.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "kejiViewController.h"

@interface kejiViewController ()

@end

@implementation kejiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//重写父类方法
-(void)setmyurl{
    self.Key=KEJI_KEY;
    self.url=KEJI_PATH;
    
}
@end
