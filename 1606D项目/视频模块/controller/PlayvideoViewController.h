//
//  PlayvideoViewController.h
//  1606D项目
//
//  Created by 王克杨的Mac on 2018/10/9.
//  Copyright © 2018年 zhangjiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
NS_ASSUME_NONNULL_BEGIN

@interface PlayvideoViewController :MPMoviePlayerViewController
@property(nonatomic,strong) NSString *mp4url;
@end

NS_ASSUME_NONNULL_END
