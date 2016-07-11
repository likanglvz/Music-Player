//
//  SingerTableViewController.m
//  Music Player
//
//  Created by 李康 on 16/7/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SingerTableViewController.h"
#import "NetWork.h"
#import "UIImageView+WebCache.h"
#import "DetailSingerTableViewController.h"

@interface SingerTableViewController ()
@property(strong,nonatomic)NSArray *area;
@property(strong,nonatomic)NSArray *sex;
@property (strong, nonatomic) NetWork * netWork;

@property(strong,nonatomic)NSArray *singerArr;




@end

@implementation SingerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%ld,%ld",(long)self.lastrow,(long)self.lastsection);
    
    self.sex = @[@"1",@"2",@"3"];
    self.area = @[@"6",@"3",@"7",@"60",@"5"];
    self.netWork = [NetWork network];
    

    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];
    
    [self getInfo];
}



- (void)getInfo
{
    NSString *tmpStr = @"abc=%E7%83%AD%E9%97%A8&from=ios&version=5.2.5&from=ios&channel=appstore";
    [self.netWork getObjectWithUrl:[NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.artist.getList&format=json&order=1&limit=50&offset=0&area=%@&sex=%@&%@",self.area[self.lastsection],self.sex[self.lastrow],tmpStr]
     
     
           Success:^(NSDictionary * dict) {
               
              // NSLog(@"歌手XXXXXXXXXXXXXXXXXXXXX-------------------------XXXXXXXXXXXXXXXXXXXXX%@",dict);
               self.singerArr = dict[@"artist"];
     
               dispatch_async(dispatch_get_main_queue(), ^{
                   [self.tableView reloadData];
               });
               
     
           } failure:^(NSError *err) {
               
               NSLog(@"%@",err);
               
           }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.singerArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
   
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text =self.singerArr[indexPath.row][@"name"];

    UIImageView *tmpImg = [[UIImageView alloc]init];
    
    [tmpImg sd_setImageWithURL:[NSURL URLWithString:self.singerArr[indexPath.row][@"avatar_middle"]] placeholderImage:[UIImage imageNamed:@"ic_blank_collect@3x"]];
    
    UIImage *tmpImage = tmpImg.image;
    
    cell.imageView.image = tmpImage;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     cell.textLabel.textColor =[UIColor whiteColor];
        
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailSingerTableViewController *detailView = [[DetailSingerTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    detailView.detailDic =self.singerArr[indexPath.row];
    
    [self.navigationController pushViewController:detailView animated:YES];
    
    
    
}

@end
