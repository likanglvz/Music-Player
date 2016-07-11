//
//  MoreSingerTableViewCell.m
//  Music Player
//
//  Created by 李康 on 16/7/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "MoreSingerTableViewCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation MoreSingerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    MoreSingerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MoreCell"];
    if (cell == nil) {
        cell = [[MoreSingerTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MoreCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
    
    
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 150, 30)];
        self.nameLab.textColor=[UIColor whiteColor];
        
        [self addSubview:self.nameLab];
        
        self.lineView = [[UIView alloc]initWithFrame:CGRectMake(30, 45, kScreenWidth-120, 5)];
        self.lineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"5cc28e26cffc1e17ab130c0b4b90f603728de9c3"]];
        [self addSubview:self.lineView];
        
    }
    
    
    return self;
}

@end
