//
//  MoreSingerTableViewController.m
//  Music Player
//
//  Created by 李康 on 16/7/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "MoreSingerTableViewController.h"
#import "MoreSingerTableViewCell.h"
#import "SingerTableViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface MoreSingerTableViewController ()
@property(strong,nonatomic)NSArray *singer;

@end

@implementation MoreSingerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];

    self.tableView.separatorStyle =UITableViewCellSelectionStyleNone;
    
    self.singer = @[@[@"华语男歌手",@"华语女歌手",@"华语乐队组合"],
                    
                    @[@"欧美男歌手",@"欧美女歌手",@"欧美乐队组合"],
                    
                    @[@"韩国男歌手",@"韩国女歌手",@"韩国乐队组合"],

                    @[@"日本男歌手",@"日本女歌手",@"日本乐队组合"],
                    
                     @[@"其他歌手"]
                    
                    ];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==4) {
        return 1;
    }
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    
    
    MoreSingerTableViewCell *cell = [MoreSingerTableViewCell cellWithTableView:tableView];
    
    cell.backgroundColor = [UIColor clearColor];
    
    switch (indexPath.section) {
        case 0:
            cell.nameLab.text = self.singer[0][indexPath.row];
            
            
            break;
        case 1:
            cell.nameLab.text = self.singer[1][indexPath.row];
            
            break;
        case 2:
            cell.nameLab.text = self.singer[2][indexPath.row];
            
            break;
        case 3:
            cell.nameLab.text = self.singer[3][indexPath.row];
            
            break;
        case 4:
            cell.nameLab.text = self.singer[4][indexPath.row];
            
            break;
            
            
        
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

//节视图

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init];
    
    myView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 90, 22)];
    
    titleLabel.textColor=[UIColor blueColor];
    
    titleLabel.backgroundColor = [UIColor clearColor];
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(10, 33, kScreenWidth, 1)];
    [line setBackgroundColor:[UIColor whiteColor]];
    
    [myView addSubview:line];
    
    switch (section) {
        case 0:
            titleLabel.text = @"华语乐坛";
            break;
        case 1:
            titleLabel.text = @"欧美流行";
            break;
        case 2:
            titleLabel.text = @"韩语乐坛";
            break;
        case 3:
            titleLabel.text = @"日语乐坛";
            break;
        case 4:
            titleLabel.text = @"其他";
            break;
    }
    [myView addSubview:titleLabel];
    
    return myView;
}

//设置节的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

//点击跳转歌手页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    SingerTableViewController *singerView = [[SingerTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    singerView.lastrow = indexPath.row;
    singerView.lastsection = indexPath.section;
    
    
    [self.navigationController pushViewController:singerView animated:YES];
    
    
}
@end
