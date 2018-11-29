//
//  basemodel.h
//  1606D项目
//
//  Created by shy 佳佳 on 2018/10/7.
//  Copyright © 2018 zhangjiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface basemodel : NSObject
@property(nonatomic,copy)NSString *title;//标题

@property(nonatomic,copy)NSString *imgsrc;//图片

@property(nonatomic,copy)NSString *digest;//概述

@property(nonatomic,copy)NSString *replyCount;//跟贴

@property(nonatomic,copy)NSString *url;//跳转url
@end

NS_ASSUME_NONNULL_END
