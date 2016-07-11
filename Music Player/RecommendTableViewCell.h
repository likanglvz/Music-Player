//
//  RecommendTableViewCell.h
//  Music Player
//
//  Created by 李康 on 16/7/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendTableViewCell : UITableViewCell
@property (strong, nonatomic) UIScrollView * scrollView;
@property (strong, nonatomic) UIImageView * imageViewFirst;
@property (strong, nonatomic) UIImageView * imageViewSecond;
@property (strong, nonatomic) UIImageView * imageViewThird;
@property (strong, nonatomic) UIImageView * imageViewFourth;
@property (strong, nonatomic) UILabel * listTitleLabel1;
@property (strong, nonatomic) UILabel * listTitleLabel2;
@property (strong, nonatomic) UILabel * listTitleLabel3;
@property (strong, nonatomic) UILabel * listTitleLabel4;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
