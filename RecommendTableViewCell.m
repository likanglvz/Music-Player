//
//  RecommendTableViewCell.m
//  Music Player
//
//  Created by 李康 on 16/7/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "RecommendTableViewCell.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation RecommendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    RecommendTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[RecommendTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //定义滚动视图范围
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/3.51)];
        //不显示水平滑动条
        self.scrollView.showsVerticalScrollIndicator=NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        //内容视图是屏幕宽度两倍
        self.scrollView.contentSize = CGSizeMake(kScreenWidth*2, kScreenHeight/3.51);
        //第一张图的ui
        self.imageViewFirst = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/25, 0, kScreenWidth/2.34, kScreenWidth/2.34)];
        self.imageViewFirst.userInteractionEnabled = YES;
        self.imageViewFirst.layer.masksToBounds = YES;
        self.imageViewFirst.layer.cornerRadius = kScreenWidth/2.34/2;
        self.imageViewFirst.layer.masksToBounds = YES;
        self.imageViewFirst.layer.borderWidth = 2;
        self.imageViewFirst.layer.borderColor = [[UIColor grayColor]CGColor];
        
        //第二张图的ui
        self.imageViewSecond = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/10 + kScreenWidth/2.34, 0, kScreenWidth/2.34, kScreenWidth/2.34)];
        self.imageViewSecond.userInteractionEnabled = YES;
        self.imageViewSecond.layer.masksToBounds = YES;
        self.imageViewSecond.layer.cornerRadius = kScreenWidth/2.34/2;
        self.imageViewSecond.layer.masksToBounds = YES;
        self.imageViewSecond.layer.borderWidth = 2;
        self.imageViewSecond.layer.borderColor = [[UIColor grayColor]CGColor];
        
        //第三张图的ui
        self.imageViewThird = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/6 + kScreenWidth/2.34*2, 0, kScreenWidth/2.34, kScreenWidth/2.34)];
        self.imageViewThird.userInteractionEnabled = YES;
        self.imageViewThird.layer.masksToBounds = YES;
        self.imageViewThird.layer.cornerRadius = kScreenWidth/2.34/2;
        self.imageViewThird.layer.masksToBounds = YES;
        self.imageViewThird.layer.borderWidth = 2;
        self.imageViewThird.layer.borderColor = [[UIColor grayColor]CGColor];
        
        //第四张图的ui
        self.imageViewFourth = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/4 + kScreenWidth/2.34*3, 0, kScreenWidth/2.34, kScreenWidth/2.34)];
        self.imageViewFourth.userInteractionEnabled = YES;
        self.imageViewFourth.layer.masksToBounds = YES;
        self.imageViewFourth.layer.cornerRadius = kScreenWidth/2.34/2;
        self.imageViewFourth.layer.masksToBounds = YES;
        self.imageViewFourth.layer.borderWidth = 2;
        self.imageViewFourth.layer.borderColor = [[UIColor grayColor]CGColor];
        
        [self.scrollView addSubview:self.imageViewFirst];
        [self.scrollView addSubview:self.imageViewSecond];
        [self.scrollView addSubview:self.imageViewThird];
        [self.scrollView addSubview:self.imageViewFourth];
        
        
        
        
        self.listTitleLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0*self.scrollView.frame.size.width * 0.5 + 10, self.imageViewFirst.frame.size.height, self.imageViewFirst.frame.size.width, 30)];
        
        self.listTitleLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(1*self.scrollView.frame.size.width * 0.5 + 10, self.imageViewFirst.frame.size.height, self.imageViewFirst.frame.size.width, 30)];
        
        self.listTitleLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(2*self.scrollView.frame.size.width * 0.5 + 10, self.imageViewFirst.frame.size.height, self.imageViewFirst.frame.size.width, 30)];
        
        self.listTitleLabel4 = [[UILabel alloc]initWithFrame:CGRectMake(3*self.scrollView.frame.size.width * 0.5 + 10, self.imageViewFirst.frame.size.height, self.imageViewFirst.frame.size.width, 30)];
        
        self.listTitleLabel1.textColor=[UIColor whiteColor];
        self.listTitleLabel2.textColor=[UIColor whiteColor];
        self.listTitleLabel3.textColor=[UIColor whiteColor];
        self.listTitleLabel4.textColor=[UIColor whiteColor];
        
        
        [self.scrollView addSubview:self.listTitleLabel1];
        [self.scrollView addSubview:self.listTitleLabel2];
        [self.scrollView addSubview:self.listTitleLabel3];
        [self.scrollView addSubview:self.listTitleLabel4];
        
        
        
        [self addSubview:self.scrollView];
    }
    
    
    
    return self;
    
    
    
}

@end
