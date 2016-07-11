//
//  ChartsViewController.m
//  Music Player
//
//  Created by 李康 on 16/6/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ChartsViewController.h"
#import "ChartsTableViewCell.h"
#import "NetWork.h"
#import "UIImageView+WebCache.h"
#import "SongTableViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ChartsViewController ()

@property (strong, nonatomic) NetWork * netWork;
@property(strong,nonatomic) UITableView *screenView;
@property(strong,nonatomic)NSArray *topArr;//排行榜数组
@end

@implementation ChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"音乐排行";
    self.screenView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight)];
    self.screenView.delegate = self;
    self.screenView.dataSource = self;
    self.screenView.backgroundColor = [UIColor clearColor];
  
    
    self.screenView.showsVerticalScrollIndicator = NO;
    self.screenView.separatorStyle = UITableViewCellSelectionStyleNone;//取消分割线
    self.netWork = [NetWork network];
    
    
    
    [self getTopSong];
    [self.view addSubview:self.screenView];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getTopSong{
    
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billCategory&format=json&from=ios&version=5.2.1&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        //NSLog(@"音乐排行的：%@",dict);
       self.topArr = dict[@"content"];
        //NSLog(@"数组里面有－－－－－－－－－－－－－－－－－－－%@",self.topArr[0]);
        [self.screenView reloadData];
//        
    } failure:^(NSError *err) {
        
        NSLog(@"%@",err);
        
        
        
    }];
   
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
       if (self.topArr !=nil&&indexPath.row<11) {
           
           ChartsTableViewCell * cell = [ChartsTableViewCell cellWithTableView1:tableView];
           
           cell.backgroundColor = [UIColor clearColor];

        
        [cell.picImageView sd_setImageWithURL:[NSURL URLWithString:self.topArr[indexPath.row][@"pic_s192"]]];
        
        cell.sheetNameLb.text = self.topArr[indexPath.row][@"name"];
        
        cell.song1.text =[NSString stringWithFormat:@"%@ - %@",self.topArr[indexPath.row][@"content"][0][@"title"],self.topArr[indexPath.row][@"content"][0][@"author"]];
        
        cell.song2.text =[NSString stringWithFormat:@"%@ - %@",self.topArr[indexPath.row][@"content"][1][@"title"],self.topArr[indexPath.row][@"content"][1][@"author"]];
        
        cell.song3.text =[NSString stringWithFormat:@"%@ - %@",self.topArr[indexPath.row][@"content"][2][@"title"],self.topArr[indexPath.row][@"content"][2][@"author"]];
        //if (self.topArr[indexPath.row][@"content"][3]!=nil) {
            cell.song4.text =[NSString stringWithFormat:@"%@ - %@",self.topArr[indexPath.row][@"content"][3][@"title"],self.topArr[indexPath.row][@"content"][3][@"author"]];
       // }
        return cell;

        
    }
        else {
            
            ChartsTableViewCell * cell = [ChartsTableViewCell cellWithTableView2:tableView];
            
            cell.backgroundColor = [UIColor clearColor];

            [cell.picImageView sd_setImageWithURL:[NSURL URLWithString:self.topArr[indexPath.row][@"pic_s192"]]];
            
            cell.sheetNameLb.text = self.topArr[indexPath.row][@"name"];
            
            cell.song1.text =[NSString stringWithFormat:@"%@ - %@",self.topArr[indexPath.row][@"content"][0][@"title"],self.topArr[indexPath.row][@"content"][0][@"author"]];
            
            cell.song2.text =[NSString stringWithFormat:@"%@ - %@",self.topArr[indexPath.row][@"content"][1][@"title"],self.topArr[indexPath.row][@"content"][1][@"author"]];
            
            cell.song3.text =[NSString stringWithFormat:@"%@ - %@",self.topArr[indexPath.row][@"content"][2][@"title"],self.topArr[indexPath.row][@"content"][2][@"author"]];
            
            return cell;

            
        }
        
    


}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
       return [self.topArr count];
    
    //
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return kScreenWidth/2.7;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SongTableViewController *songView = [[SongTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    songView.detailDic =self.topArr[indexPath.row];
    
    [self.navigationController pushViewController:songView animated:YES];
    

}





@end
