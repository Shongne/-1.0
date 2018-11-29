//
//  basecell.m
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import "basecell.h"

@implementation basecell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)loadDataFromModel:(basemodel *)model{
    if (model) {
        self.titleLabel.text = model.title;
        [self.imgV sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        self.digestLabel.text = model.digest;
        self.replyCountLable.text = [NSString stringWithFormat:@"%@评论",model.replyCount];
    }
}

@end
