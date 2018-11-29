//
//  VideoTableViewCell.m
//  1606D项目
//
//  Created by 王克杨的Mac on 2018/10/8.
//  Copyright © 2018年 zhangjiliang. All rights reserved.
//

#import "VideoTableViewCell.h"

@implementation VideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)loadDataFromModel:(videomodel *)model{
    if (model) {
        [self.coverImgV sd_setImageWithURL:[NSURL URLWithString:model.cover]];
        self.titleLabel.text = model.title;
        self.lengthLabel.text = [NSString stringWithFormat:@"时长 %@",model.length];
        self.playCountLabel.text = [NSString stringWithFormat:@"播放 %@",model.playCount];
        self.replyCountLabel.text =[NSString stringWithFormat:@"%@评论",model.replyCount];
    }
    
}

@end
