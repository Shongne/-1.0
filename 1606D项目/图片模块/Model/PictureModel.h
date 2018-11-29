//
//  PictureModel.h
//  1606D项目
//
//  Created by 王克杨的Mac on 2018/10/9.
//  Copyright © 2018年 zhangjiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PictureModel : NSObject
@property(nonatomic,copy)NSString *setname;

@property(nonatomic,copy)NSString *clientcover1;

@property(nonatomic,copy)NSString *setid;

@property(nonatomic,copy)NSString *imgsum;

@property(nonatomic,copy)NSString *replynum;

@property(nonatomic,strong)NSArray * pics;

@property(nonatomic,strong)NSString * desc;
@end

NS_ASSUME_NONNULL_END
