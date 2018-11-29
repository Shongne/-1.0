//
//  PlayvideoViewController.m
//  1606D项目
//
//  Created by 王克杨的Mac on 2018/10/9.
//  Copyright © 2018年 zhangjiliang. All rights reserved.
//

#import "PlayvideoViewController.h"

@interface PlayvideoViewController ()

@end

@implementation PlayvideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.moviePlayer.contentURL=[NSURL URLWithString:self.mp4url];
    [self.moviePlayer play];
}


@end
