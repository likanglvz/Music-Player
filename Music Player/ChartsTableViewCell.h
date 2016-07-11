//
//  ChartsTableViewCell.h
//  Music Player
//
//  Created by 李康 on 16/7/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChartsTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView * picImageView;//歌单图片
@property (strong, nonatomic) UILabel * sheetNameLb;//歌单名
@property (strong, nonatomic) UIView * lineView;//歌单下一条白线
@property (strong, nonatomic) UILabel * song1;//排行榜歌曲1
@property (strong, nonatomic) UILabel * song2;//排行榜歌曲2
@property (strong, nonatomic) UILabel * song3;//排行榜歌曲3
@property (strong, nonatomic) UILabel * song4;//排行榜歌曲4

@property (strong, nonatomic) UILabel * top1;//排行1
@property (strong, nonatomic) UILabel * top2;//排行2
@property (strong, nonatomic) UILabel * top3;//排行3
@property (strong, nonatomic) UILabel * top4;//排行4


+ (instancetype)cellWithTableView1:(UITableView *)tableView;
+ (instancetype)cellWithTableView2:(UITableView *)tableView;
@end
