//
//  videomodel.h
//  1606D项目
//
//  Created by 王克杨的Mac on 2018/10/9.
//  Copyright © 2018年 zhangjiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface videomodel : NSObject
@property(nonatomic,copy)NSString *replyCount;//跟贴

@property(nonatomic,copy)NSString *cover;//图片

@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *playCount;//播放数

@property(nonatomic,copy)NSString *mp4_url;

@property(nonatomic,copy)NSString *length;//时长
@end

NS_ASSUME_NONNULL_END
