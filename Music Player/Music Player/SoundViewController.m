//
//  SoundViewController.m
//  Music Player
//
//  Created by 李康 on 16/6/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SoundViewController.h"
#import "XRCarouselView.h"
#import "AFNetworking.h"
#import "NetWork.h"
#import "UIImageView+WebCache.h"
#import "RecommendTableViewCell.h"
#import "SongListTableViewCell.h"
#import "SongTableViewController.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
static NSString *identifier = @"Cell";
@interface SoundViewController ()
//主界面的tb
@property (weak, nonatomic) IBOutlet UITableView *screenTable;
@property(nonatomic,strong)XRCarouselView *AdView;//轮播视图
@property(strong,nonatomic) NSArray *ADimage;
@property (strong, nonatomic) NetWork * netWork;

@property (strong, nonatomic) NSArray * hotRecommendArr;//热门推荐

@property (strong, nonatomic) NSArray * songListArr;//热门歌单

@end

@implementation SoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"听觉盛宴";
     //self.AdView = [self loadSelfXRCarouselView];
    
    self.AdView = [[XRCarouselView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, 180)];
    self.screenTable.tableHeaderView = self.AdView;
    self.screenTable.showsVerticalScrollIndicator = NO;
    self.screenTable.separatorStyle = UITableViewCellSelectionStyleNone;//取消分割线
    //设置音阶动画
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_upbar_icon_playing12"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(changeList)];
    
//   // while (1) {
//        [UIView beginAnimations:nil context:nil];
//        
//        [UIView setAnimationDuration:10.0];//设置时长
//        
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_upbar_icon_playing1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(changeList)];
// 
//        
//  //  }
    
    //设置TB的背景图片
     [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];
    self.screenTable.backgroundColor = [UIColor clearColor];
     self.netWork = [NetWork network];
    [self getTopImgView];
    [self getHotRecommend];
    [self getSongList];
    
   
}

-(void)changeList{
    
    NSLog(@"1");
}
- (void)getTopImgView
{
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.plaza.getFocusPic&format=json&from=ios&version=5.2.3&from=ios&channel=appstore"
        Success:^(NSDictionary * dict) {
                               
           NSArray * imageInfo = dict[@"pic"];
           NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:@[]];
           for (id tmp in imageInfo) {
               NSString * imagePath = tmp[@"randpic_iphone6"];
               
               [arr addObject:imagePath];
               
               
               //[tmp addTarget:self action:@selector(click)];
           }
           //self.imageview.image = [UIImage imageNamed:arr[0]];
//                               self.ADimage = arr;
          // NSLog(@"图片名:%@",arr[0]);
//           NSMutableArray *array = [NSMutableArray arrayWithCapacity:[arr count]];
//               for (int i =0; i<[arr count]; i++) {
//                   
//                   UIImageView *tmp = arr[i];
//                   [array addObject:tmp.image];
//                   
//               }
           
           self.AdView.imageArray = arr;
          // [self loadSelfXRCarouselView:arr];
           
       } failure:^(NSError *err) {
           
           NSLog(@"%@",err);
           
       }];
    
}

//-(void)click{
//    
//    NSLog(@"广告位点击");
//    
//}
//热门推荐
- (void)getHotRecommend
{
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.diy.getHotGeDanAndOfficial&num=4&version=5.2.3&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        NSLog(@"热门推荐XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX%@",dict);
        
        self.hotRecommendArr = dict[@"content"][@"list"];
        
        [self.screenTable reloadData];
        
    } failure:^(NSError *err) {
        NSLog(@"%@",err);
    }];
    
    
    
}



//热门歌单
-(void)getSongList{
    
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.diy.gedan&page_no=1&page_size=30&from=ios&version=5.2.3&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        NSLog(@"热门歌单:%@",dict);
        
        self.songListArr = dict[@"content"];
        [self.screenTable reloadData];
        
    } failure:^(NSError *err) {
        
        NSLog(@"%@",err);

        
    }];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    // 不同的section不同的row
    if (section == 0) {
        return 1;
    }else{
        return [self.songListArr count];
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0&&indexPath.row == 0) {
        
        RecommendTableViewCell * cell = [RecommendTableViewCell cellWithTableView:tableView];
        cell.backgroundColor = [UIColor clearColor];
        if (self.hotRecommendArr != nil) {
            
            [cell.imageViewFirst sd_setImageWithURL:[NSURL URLWithString:self.hotRecommendArr[0][@"pic"]]];
            [cell.imageViewSecond sd_setImageWithURL:[NSURL URLWithString:self.hotRecommendArr[1][@"pic"]]];
            [cell.imageViewThird sd_setImageWithURL:[NSURL URLWithString:self.hotRecommendArr[2][@"pic"]]];
            [cell.imageViewFourth sd_setImageWithURL:[NSURL URLWithString:self.hotRecommendArr[3][@"pic"]]];
            
            
            cell.listTitleLabel1.text=self.hotRecommendArr[0][@"title"];
            
            cell.listTitleLabel2.text=self.hotRecommendArr[1][@"title"];
            cell.listTitleLabel3.text=self.hotRecommendArr[2][@"title"];
            cell.listTitleLabel4.text=self.hotRecommendArr[3][@"title"];
            
        }
        
        return cell;
       
        
    }
    else{
        
        SongListTableViewCell * cell = [SongListTableViewCell cellWithTableView:tableView];
        
        cell.backgroundColor = [UIColor clearColor];
        if (self.songListArr !=nil) {
            
            [cell.picImageView sd_setImageWithURL:[NSURL URLWithString:self.songListArr[indexPath.row][@"pic_300"]]];
            cell.sheetNameLb.text = self.songListArr[indexPath.row][@"title"];
            cell.introduceLb.text = self.songListArr[indexPath.row][@"desc"];
            cell.introduceLb.numberOfLines=0;
            cell.audienceNumLb.text = self.songListArr[indexPath.row][@"listenum"];
            cell.iconImgView.image = [UIImage imageNamed:@"sing_img_note8@2x"];
        }
            return cell;
            
        }

    
    
}
    
//设置section的背景 字体
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init];
    
    myView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 90, 22)];
    
    titleLabel.textColor=[UIColor whiteColor];
    
    titleLabel.backgroundColor = [UIColor clearColor];
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(10, 21, kScreenWidth, 1)];
    [line setBackgroundColor:[UIColor whiteColor]];
   
    [myView addSubview:line];
    
    if (section ==0) {
        titleLabel.text = @"热门推荐";
        
    }else{
         titleLabel.text =@"热门歌单";
    }
    
    [myView addSubview:titleLabel];
    
    return myView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return kScreenHeight/3.51;
    }else{
        
        return kScreenWidth/2.34;
    }
    
}


//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    SongTableViewController *songView = [[SongTableViewController alloc]initWithStyle:UITableViewStylePlain];
//    
//    if (indexPath.section == 0) {
//        
//        songView.detailDic = e
//        
//    }else{
//     
//        songView.detailDic =self.topArr[indexPath.row];
//        
//    }
//    
//    
//    [self.navigationController pushViewController:songView animated:YES];
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}

//设置节的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}
@end
