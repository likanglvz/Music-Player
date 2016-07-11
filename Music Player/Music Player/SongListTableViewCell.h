//
//  SongListTableViewCell.h
//  Music Player
//
//  Created by 李康 on 16/7/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongListTableViewCell : UITableViewCell
@property (strong, nonatomic) UIImageView * picImageView;//歌单图片
@property (strong, nonatomic) UILabel * sheetNameLb;//歌单名
@property (strong, nonatomic) UIView * lineView;//歌单下一条白线
@property (strong, nonatomic) UILabel * introduceLb;//歌单简介
@property (strong, nonatomic) UIImageView * iconImgView;//音符图片
@property (strong, nonatomic) UILabel * audienceNumLb;//听众量

@property (strong, nonatomic) UIView * lineView2;//分割白线

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
