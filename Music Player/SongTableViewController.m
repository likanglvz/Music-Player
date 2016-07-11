//
//  SongTableViewController.m
//  Music Player
//
//  Created by 李康 on 16/7/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SongTableViewController.h"

#import "NetWork.h"
#import "UIImageView+WebCache.h"
#import "PlayViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface SongTableViewController ()

@property (strong, nonatomic) NetWork * netWork;
@property(strong,nonatomic)NSArray *songList;
@end

@implementation SongTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.netWork = [NetWork network];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];
    
    
    UIImageView *headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/3)];
    if (self.detailDic[@"pic_s444"] == nil) {
        
        [headView sd_setImageWithURL:[NSURL URLWithString:self.detailDic[@"pic_w300"]]];
        
    }if (self.detailDic[@"pic_w300"] == nil) {
        
        [headView sd_setImageWithURL:[NSURL URLWithString:self.detailDic[@"pic_s444"]]];
        
    }
    
    
    self.tableView.tableHeaderView = headView;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self getSongList];
}

-(void)getSongList{
    


    NSString *str1 =[NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billList&type=%@",self.detailDic[@"type"]];
    
    NSString *str2 = @"&format=json&offset=0&size=50&from=ios&fields=title,song_id,author,resource_type,havehigh,is_new,has_mv_mobile,album_title,ting_uid,album_id,charge,all_rate&version=5.2.1&from=ios&channel=appstore";
    
    [self.netWork getObjectWithUrl:[str1 stringByAppendingString:str2] Success:^(NSDictionary *dict) {
        
        NSLog(@"歌曲有XxxxxxxxxxxxxxxxxxxXX：%@",dict);
        self.songList = dict[@"song_list"];
        
        [self.tableView reloadData];
        //
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongList" ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SongList"];
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
    
    
    
    PlayViewController *playView =  [storyboard instantiateViewControllerWithIdentifier:@"play"];
    
    //NSMutableArray *tmparr = [NSMutableArray array];
    
//    for (int i =0; i<[self.songList count]; i++) {
//        
//        [tmparr addObject:self.songList[i]];
//        
//    }
    
   // playView.musics =[NSArray arrayWithArray:tmparr];
    playView.musics = _songList;
    playView.musicIndex = indexPath.row;
    
    
    [self.navigationController pushViewController:playView animated:YES];
    
    
    
    
    
}
@end
