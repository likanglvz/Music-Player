//
//  HeaderCollectionReusableView.m
//  播放应用
//
//  Created by zkftjs on 16/7/4.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "HeaderCollectionReusableView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation HeaderCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.moreBtn=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth - kScreenWidth / 3, 0, 90, 30)];
    self.moreBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [self.moreBtn setTitle:@"More Singer" forState:UIControlStateNormal];
    [self.moreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.moreBtn addTarget:self action:@selector(moreSinger) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.moreBtn];
    
    self.SectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 70, 30)];
    [self addSubview:_SectionLabel];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(30, self.SectionLabel.frame.size.height , self.bounds.size.width-30, 1)];
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
}

-(void)moreSinger
{
    [self.delegate jumpToNextController];
}




@end
