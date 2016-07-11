//
//  DetailSingerTableViewController.m
//  Music Player
//
//  Created by 李康 on 16/7/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "DetailSingerTableViewController.h"
#import "NetWork.h"
#import "UIImageView+WebCache.h"
#import "PlayViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface DetailSingerTableViewController ()

@property (strong, nonatomic) NetWork * netWork;
@property(strong,nonatomic) NSArray *songList;
@end

@implementation DetailSingerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.netWork = [NetWork network];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];

    self.navigationItem.title =self.detailDic[@"name"];

    UIImageView *headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/3)];
    [headView sd_setImageWithURL:[NSURL URLWithString:self.detailDic[@"avatar_big"]]];
    
    self.tableView.tableHeaderView = headView;
    
    [self getSongList];
    
}

-(void)getSongList{
    NSString *tmpStr = [NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.artist.getSongList&format=json&tinguid=%@",self.detailDic[@"ting_uid"]];
    
    NSString *tmpStr2 =@"&artistid(null)&limits=30&order=2&offset=0&version=5.2.5&from=ios&channel=appstore";
    
    [self.netWork getObjectWithUrl:[tmpStr stringByAppendingString:tmpStr2]
        Success:^(NSDictionary * dict) {
           
           
            NSLog(@"有这些歌———————————————————————————————————————————————————————————————————%@",dict);
            
            self.songList = dict[@"songlist"];
            
            [self.tableView reloadData];
     
           
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

    return [self.songList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Song" ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Song"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld  %@",indexPath.row+1,self.songList[indexPath.row][@"title"]];
    cell.detailTextLabel.text = self.songList[indexPath.row][@"author"];
    
    cell.textLabel.textColor =[UIColor whiteColor];
    
     cell.detailTextLabel.textColor =[UIColor whiteColor];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"PlayStoryboard" bundle:[NSBundle mainBundle]];
    //听觉盛宴
  

    PlayViewController *playView =  [storyboard instantiateViewControllerWithIdentifier:@"play"];
    
    //playView.musicDic = self.songList[indexPath.row];
    playView.musics = _songList;
    playView.musicIndex = indexPath.row;
    
    
    [self.navigationController pushViewController:playView animated:YES];
}

@end
