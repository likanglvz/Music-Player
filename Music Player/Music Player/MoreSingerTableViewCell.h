//
//  MoreSingerTableViewCell.h
//  Music Player
//
//  Created by 李康 on 16/7/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreSingerTableViewCell : UITableViewCell
@property(strong,nonatomic) UILabel *nameLab;

@property(strong,nonatomic)UIView *lineView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
