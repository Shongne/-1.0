//
//  VideoTableViewCell.h
//  1606D项目
//
//  Created by 王克杨的Mac on 2018/10/8.
//  Copyright © 2018年 zhangjiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "videomodel.h"
NS_ASSUME_NONNULL_BEGIN

@interface VideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImgV;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *lengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;

-(void)loadDataFromModel:(videomodel *)model;
@end

NS_ASSUME_NONNULL_END
