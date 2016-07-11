//
//  ThemeCollectionViewCell.m
//  MusicPlayer
//
//  Created by AppleUser1 on 16/7/4.
//  Copyright © 2016年 AppleUser1. All rights reserved.
//

#import "ThemeCollectionViewCell.h"

@implementation ThemeCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
 
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,80, 80)];
        self.imageView.layer.borderColor = [[UIColor whiteColor]CGColor];
        self.imageView.layer.borderWidth = 2;
        
        self.backgroundColor = [UIColor clearColor];
        self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, 80, 20)];
        [self.imageView addSubview:self.nameLab];
        [self.contentView addSubview:self.imageView];

    }
    
    return self;
}

@end
