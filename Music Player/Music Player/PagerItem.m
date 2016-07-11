//
//  PagerItem.m
//  Music Player
//
//  Created by 李康 on 16/6/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "PagerItem.h"

@implementation PagerItem

-(void)setContent:(UIView *)content{
    _content=content;
    
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.contentView addSubview:content];
    
    
    
}

@end
