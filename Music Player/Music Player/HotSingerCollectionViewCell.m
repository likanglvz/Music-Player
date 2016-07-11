//
//  HotSingerCollectionViewCell.m
//  MusicPlayer
//
//  Created by 李康 on 16/7/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "HotSingerCollectionViewCell.h"

@implementation HotSingerCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置cell中的label
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, 80, 20)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.label];
        //设置cell 中的imageview
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        self.imageView.layer.masksToBounds = YES;
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2;
        self.imageView.layer.borderWidth = 2;
        self.imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
        [self.contentView addSubview:self.imageView];
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
}

@end
