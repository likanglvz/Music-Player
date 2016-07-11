//
//  ChartsTableViewCell.m
//  Music Player
//
//  Created by 李康 on 16/7/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ChartsTableViewCell.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@implementation ChartsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView1:(UITableView *)tableView
{
    ChartsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell1"];
    if (cell == nil) {
       
        cell = [[ChartsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier1:@"TopCell1"];
    }
    return cell;
}

+ (instancetype)cellWithTableView2:(UITableView *)tableView
{
    ChartsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell"];
    if (cell == nil) {
        
        cell = [[ChartsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TopCell"];
    }
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//解析出最后一个 只有三行 重写
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self.top1 = [[UILabel alloc]init];
    self.top2 = [[UILabel alloc]init];
    self.top3 = [[UILabel alloc]init];
    
    self.song1 = [[UILabel alloc]init];
    self.song2 = [[UILabel alloc]init];
    self.song3 = [[UILabel alloc]init];
    
    self.song1.textColor = [UIColor whiteColor];
    self.song2.textColor = [UIColor whiteColor];
    self.song3.textColor = [UIColor whiteColor];
    
    
    self.top1.textColor = [UIColor whiteColor];
    self.top2.textColor = [UIColor whiteColor];
    self.top3.textColor = [UIColor whiteColor];
    
    
    
    
    
    
    NSArray *topNum = @[self.top1,self.top2,self.top3];
    
    NSArray *song = @[self.song1,self.song2,self.song3];
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.picImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, self.frame.size.width/2.7, self.frame.size.width/2.7)];
        self.picImageView.layer.masksToBounds = YES;
        self.picImageView.layer.borderWidth = 2;
        // self.picImageView.layer.cornerRadius = self.picImageView.frame.size.height/2;
        self.picImageView.layer.borderColor = [[UIColor grayColor]CGColor];
        
        self.sheetNameLb = [[UILabel alloc]initWithFrame:CGRectMake(self.picImageView.bounds.size.width + 30, 10, kScreenWidth-self.picImageView.bounds.size.width-65, 30)];
        self.sheetNameLb.textColor = [UIColor whiteColor];
        
        self.lineView = [[UIView alloc]initWithFrame:CGRectMake(30+self.picImageView.bounds.size.width, 40, kScreenWidth-self.picImageView.bounds.size.width-65, 1)];
        self.lineView.backgroundColor = [UIColor whiteColor];
        
        
        
        for (int i =0; i<3; i++) {
            
            //排行榜的数字
            UILabel *tmpLabel = topNum[i];
            tmpLabel.frame =CGRectMake(30+self.picImageView.bounds.size.width, (i+1)*25+30, 15, 10);
            
            tmpLabel.textColor = [UIColor orangeColor];
            tmpLabel.text = [NSString stringWithFormat:@"%d",i+1];
            tmpLabel.font = [UIFont fontWithName:@"Arial" size:10];
            
            //排行榜的歌名
            UILabel *tmpLabel1 = song[i];
            tmpLabel1.frame = CGRectMake(15+self.picImageView.bounds.size.width+30, (i+1)*25+25, self.lineView.bounds.size.width, 20);
            tmpLabel1.font = [UIFont fontWithName:@"Arial" size:13];
            tmpLabel1.textColor = [UIColor whiteColor];
            tmpLabel1.text = @"";
            
            [self addSubview:tmpLabel];
            [self addSubview:tmpLabel1];
            
        }
        
        
        
        [self addSubview:self.picImageView];
        [self addSubview:self.sheetNameLb];
        [self addSubview:self.lineView];
        
        
        
        
        
    }

    
    return self;
}
//自定义格式
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier1:(NSString *)reuseIdentifier
{
    
    self.top1 = [[UILabel alloc]init];
    self.top2 = [[UILabel alloc]init];
    self.top3 = [[UILabel alloc]init];
    self.top4 = [[UILabel alloc]init];
    
    self.top1.textColor = [UIColor whiteColor];
    self.top2.textColor = [UIColor whiteColor];
    self.top3.textColor = [UIColor whiteColor];
    self.top4.textColor = [UIColor whiteColor];
    
    self.song1 = [[UILabel alloc]init];
     self.song2 = [[UILabel alloc]init];
     self.song3 = [[UILabel alloc]init];
     self.song4 = [[UILabel alloc]init];
    self.song1.textColor = [UIColor whiteColor];
    self.song2.textColor = [UIColor whiteColor];
    self.song3.textColor = [UIColor whiteColor];
    self.song4.textColor = [UIColor whiteColor];
    
    
    NSArray *topNum = @[self.top1,self.top2,self.top3,self.top4];
    
    NSArray *song = @[self.song1,self.song2,self.song3,self.song4];
   
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.picImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, self.frame.size.width/2.7, self.frame.size.width/2.7)];
        self.picImageView.layer.masksToBounds = YES;
        self.picImageView.layer.borderWidth = 2;
       // self.picImageView.layer.cornerRadius = self.picImageView.frame.size.height/2;
        self.picImageView.layer.borderColor = [[UIColor grayColor]CGColor];
        
        self.sheetNameLb = [[UILabel alloc]initWithFrame:CGRectMake(self.picImageView.bounds.size.width + 30, 10, kScreenWidth-self.picImageView.bounds.size.width-65, 30)];
        
        self.lineView = [[UIView alloc]initWithFrame:CGRectMake(30+self.picImageView.bounds.size.width, 40, kScreenWidth-self.picImageView.bounds.size.width-65, 1)];
        self.lineView.backgroundColor = [UIColor whiteColor];
        
    
        
        for (int i =0; i<4; i++) {
            
            //排行榜的数字
            UILabel *tmpLabel = topNum[i];
            tmpLabel.frame =CGRectMake(30+self.picImageView.bounds.size.width, (i+1)*25+30, 15, 10);
            
            tmpLabel.textColor = [UIColor orangeColor];
            tmpLabel.text = [NSString stringWithFormat:@"%d",i+1];
             tmpLabel.font = [UIFont fontWithName:@"Arial" size:10];
            
            //排行榜的歌名
             UILabel *tmpLabel1 = song[i];
            tmpLabel1.frame = CGRectMake(15+self.picImageView.bounds.size.width+30, (i+1)*25+25, self.lineView.bounds.size.width, 20);
            tmpLabel1.font = [UIFont fontWithName:@"Arial" size:13];
            tmpLabel1.text = @"";
            
            [self addSubview:tmpLabel];
            [self addSubview:tmpLabel1];
            
        }
        
        
        
        [self addSubview:self.picImageView];
        [self addSubview:self.sheetNameLb];
        [self addSubview:self.lineView];
        
        
        
        
        
    }
    
    
    return self;
}

@end
