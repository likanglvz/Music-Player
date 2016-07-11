//
//  SongListTableViewCell.m
//  Music Player
//
//  Created by 李康 on 16/7/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SongListTableViewCell.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation SongListTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    SongListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HotCell"];
    if (cell == nil) {
        cell = [[SongListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HotCell"];
    }
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.picImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, self.frame.size.width/2.7, self.frame.size.width/2.7)];
        self.picImageView.layer.masksToBounds = YES;
        self.picImageView.layer.borderWidth = 2;
        self.picImageView.layer.cornerRadius = self.picImageView.frame.size.height/2;
        self.picImageView.layer.borderColor = [[UIColor grayColor]CGColor];
        
        self.sheetNameLb = [[UILabel alloc]initWithFrame:CGRectMake(self.picImageView.frame.size.width + 30, 15, kScreenWidth/1.86, 25)];
        
        self.lineView = [[UIView alloc]initWithFrame:CGRectMake(self.sheetNameLb.frame.origin.x, self.sheetNameLb.frame.origin.y + 25, kScreenWidth/2, 1)];
        self.lineView.backgroundColor = [UIColor whiteColor];
        
        self.introduceLb = [[UILabel alloc]initWithFrame:CGRectMake(self.sheetNameLb.frame.origin.x,self.sheetNameLb.frame.size.height + 15 , kScreenWidth/1.86, 100)];
        
        self.iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.picImageView.frame.size.width + 30, self.picImageView.frame.size.height + 15, 15, 15)];
        
        self.audienceNumLb = [[UILabel alloc]initWithFrame:CGRectMake(self.picImageView.frame.size.width + self.iconImgView.frame.size.width + 35, self.picImageView.frame.size.height + 15, 70, 20)];
        
        self.lineView2 =[[UIView alloc]initWithFrame:CGRectMake(15, self.picImageView.frame.size.height + 40, kScreenWidth, 1)];
         self.lineView2.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.picImageView];
        [self addSubview:self.sheetNameLb];
        [self addSubview:self.lineView];
        [self addSubview:self.introduceLb];
        [self addSubview:self.iconImgView];
        [self addSubview:self.audienceNumLb];
        [self addSubview:self.lineView2];
        
        
        
    }
    
    
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
