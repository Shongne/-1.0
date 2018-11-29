//
//  basecell.h
//  1606D项目
//
//  Created by shy 佳佳 on 2018/9/28.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"basemodel.h"
NS_ASSUME_NONNULL_BEGIN

@interface basecell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLable;

-(void)loadDataFromModel:(basemodel *)model;
@end

NS_ASSUME_NONNULL_END
