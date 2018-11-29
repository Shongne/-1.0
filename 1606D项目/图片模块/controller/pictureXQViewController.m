//
//  pictureXQViewController.m
//  1606D项目
//
//  Created by 王克杨的Mac on 2018/10/9.
//  Copyright © 2018年 zhangjiliang. All rights reserved.
//

#import "pictureXQViewController.h"

@interface pictureXQViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) UIScrollView *scrollview;
@property(nonatomic,strong) UILabel *numberlab;
@end

@implementation pictureXQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //beijingyanse
    self.view.backgroundColor=[UIColor blackColor];
    //创建滚动
    [self createscroll];
    //创建描述详情视图
    [self createdesview];
}
//滚动图片
-(void)createscroll{
    self.scrollview=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 180, WIDTH, 250)];
    
    self.scrollview.bounces=NO;
    self.scrollview.pagingEnabled=YES;
    self.scrollview.delegate=self;
    self.scrollview.showsVerticalScrollIndicator=NO;
    self.scrollview.showsHorizontalScrollIndicator=NO;
    self.scrollview.contentSize=CGSizeMake(WIDTH*_model.pics.count, 250);
    for (int i=0; i<_model.pics.count; i++) {
        //图片
        UIImageView *imagv=[[UIImageView alloc] initWithFrame:CGRectMake(i*WIDTH, 0, WIDTH, 250)];
       [ imagv sd_setImageWithURL:[NSURL URLWithString:_model.pics[i]]];
        [_scrollview addSubview:imagv];
     
    }
       [self.view addSubview:_scrollview];
}
-(void)createdesview{
    //标题文字
    UILabel *titlelable=[[UILabel alloc] initWithFrame:CGRectMake(20, 440, WIDTH-120, 20)];
    titlelable.textColor=[UIColor whiteColor];
    titlelable.font=[UIFont systemFontOfSize:15];
    titlelable.text=_model.setname;
    [self.view addSubview:titlelable];
    
    //详细文字
    UILabel *titlelable1=[[UILabel alloc] initWithFrame:CGRectMake(20, 445, WIDTH-40, 100)];
    titlelable1.textColor=[UIColor whiteColor];
    titlelable1.numberOfLines=0;
    titlelable1.font=[UIFont systemFontOfSize:14];
    titlelable1.text=_model.desc;
    [self.view addSubview:titlelable1];
    //图片数量
    _numberlab=[[UILabel alloc] initWithFrame:CGRectMake(WIDTH-100, 440, 80, 20)];
    _numberlab.textColor=[UIColor whiteColor];
    _numberlab.font=[UIFont systemFontOfSize:13];
   _numberlab.text= [NSString stringWithFormat:@"1/%ld",_model.pics.count];
    _numberlab.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:_numberlab];
}

//关联
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _numberlab.text=[NSString stringWithFormat:@"%0.0f/%ld",(scrollView.contentOffset.x/WIDTH+1),_model.pics.count];
    
}

@end
