//
//  ClassifyViewController.m
//  Music Player
//
//  Created by 李康 on 16/6/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ClassifyViewController.h"
#import "NetWork.h"
#import "UIImageView+WebCache.h"
#import "HotSingerCollectionViewCell.h"
#import "ThemeCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "MoreSingerTableViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ClassifyViewController ()<headerViewDelegate>
@property (strong, nonatomic) NetWork * netWork;

@property(strong,nonatomic)UICollectionView *screenView;

@property(strong,nonatomic) NSArray *popularSinger;
@property(strong,nonatomic)NSMutableDictionary *themeDic;

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"分类享听";
     self.netWork = [NetWork network];
    self.themeDic = [NSMutableDictionary dictionary
                     ];
    //背景色
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];

   
//    UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonSystemItemAdd  target:self action:@selector(search)];
//    
//    self.navigationItem.rightBarButtonItem = searchBtn;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //flowLayout.itemSize = CGSizeMake(80, 80);
    
    flowLayout.headerReferenceSize = CGSizeMake(kScreenWidth, 41);
    
    self.screenView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:flowLayout];
    //注册cell
    [self.screenView registerClass:[HotSingerCollectionViewCell class] forCellWithReuseIdentifier:@"HotSingerCell"];
    [self.screenView registerClass:[ThemeCollectionViewCell class] forCellWithReuseIdentifier:@"ThemeCell"];
    
    
    self.screenView.backgroundColor = [UIColor clearColor];
    
    self.screenView.delegate=self;
    self.screenView.dataSource =self;
    self.screenView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.screenView];
    [_screenView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"myheheIdentifier"];
    //collection头视图的注册
    
    //headView的设置及注册
   
    [_screenView registerNib:[UINib nibWithNibName:NSStringFromClass([HeaderCollectionReusableView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    

    [self getpopularSinger];
    [self getAge];
    [self getStyle];
    [self getFeeling];
    [self getSubject];
    [self getActivity];
    [self getLanguage];
   // NSLog(@"主题有_____________________________________________________%@",self.themeDic);
    
    
}
//热门歌手
-(void)getpopularSinger{
    
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.artist.getList&format=json&order=1&limit=6&offset=0&area=0&sex=0&abc=&from=ios&version=5.2.1&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        //NSLog(@"热门歌手_______________________________________________%@",dict);
        self.popularSinger = dict[@"artist"];
        
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:0];
        [self.screenView reloadSections:indexSet];

        
    } failure:^(NSError *err) {
        
        NSLog(@"%@",err);
    }];
   
}

//活动
-(void)getActivity{
    
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryScene&category_id=0&version=5.2.5&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        //NSLog(@"活动_______________________________________________%@",dict);
        
        [self.themeDic setValue:dict[@"result"] forKey:@"1"];
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:1];
        [self.screenView reloadSections:indexSet];
       
        
    } failure:^(NSError *err) {
        
        NSLog(@"%@",err);
    }];
    
}

//心情
-(void)getFeeling{
    
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryScene&category_id=3&version=5.2.5&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        //NSLog(@"心情_______________________________________________%@",dict);
        [self.themeDic setValue:dict[@"result"] forKey:@"2"];
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:2];
        [self.screenView reloadSections:indexSet];
    } failure:^(NSError *err) {
        
        NSLog(@"%@",err);
    }];
    
}

//主题
-(void)getSubject{
    
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryScene&category_id=1&version=5.2.5&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        //NSLog(@"主题_______________________________________________%@",dict);
        [self.themeDic setValue:dict[@"result"] forKey:@"3"];
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:3];
        [self.screenView reloadSections:indexSet];

        
    } failure:^(NSError *err) {
        
        NSLog(@"%@",err);
    }];
    
}

//语言
-(void)getLanguage{
    
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryScene&category_id=4&version=5.2.5&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        //NSLog(@"语言_______________________________________________%@",dict);
        [self.themeDic setValue:dict[@"result"] forKey:@"4"];
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:4];
        [self.screenView reloadSections:indexSet];
        
    } failure:^(NSError *err) {
        
        NSLog(@"%@",err);
    }];
    
}

//年代
-(void)getAge{
    
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryScene&category_id=5&version=5.2.5&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        //NSLog(@"年代_______________________________________________%@",dict);
        [self.themeDic setValue:dict[@"result"] forKey:@"5"];
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:5];
        [self.screenView reloadSections:indexSet];

        
    } failure:^(NSError *err) {
        
        NSLog(@"%@",err);
    }];
    
}

//曲风
-(void)getStyle{
    
    [self.netWork getObjectWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryScene&category_id=6&version=5.2.5&from=ios&channel=appstore" Success:^(NSDictionary *dict) {
        
        //NSLog(@"曲风_______________________________________________%@",dict);
        [self.themeDic setValue:dict[@"result"] forKey:@"6"];
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:6];
        [self.screenView reloadSections:indexSet];

        
    } failure:^(NSError *err) {
        
        NSLog(@"%@",err);
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//搜索按钮
-(void)search{
    
    NSLog(@"search");
    
}
//指定组的个数 ，一个大组！！不是一排，是N多排组成的一个大组(与下面区分)
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}

//指定单元格的个数 ，这个是一个组里面有多少单元格，e.g : 一个单元格就是一张图片
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    }
    
    if (section == 1) {
        return [self.themeDic[@"1"] count];
    }
    if (section == 2) {
        return [self.themeDic[@"2"] count];
    }
    if (section == 3) {
        return [self.themeDic[@"3"] count];
    }
    if (section == 4) {
        return [self.themeDic[@"4"] count];
    }
    if (section == 5) {
        return [self.themeDic[@"5"] count];
    }
    else {
        return [self.themeDic[@"6"] count];
    }
    
}

//构建单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        HotSingerCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotSingerCell" forIndexPath:indexPath];
   
    
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.popularSinger[indexPath.row][@"avatar_middle"]]];
        cell.label.text =self.popularSinger[indexPath.row][@"name"];
    return cell;
        
    }else{
        ThemeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeCell" forIndexPath:indexPath];
        if (self.themeDic != nil) {
            NSString * tmpKey = [NSString stringWithFormat:@"%lu",indexPath.section];
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.themeDic[tmpKey][indexPath.row][@"icon_ios"]]];
            cell.nameLab.text =self.themeDic[tmpKey][indexPath.row][@"scene_name"];
        }
        return cell;
    }
    
    
}

//组的头视图创建
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    

    HeaderCollectionReusableView *headView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    headView.delegate=self;
    switch (indexPath.section) {
        case 0:
            headView.SectionLabel.text=@"热门歌手";
            headView.moreBtn.hidden=NO;
            break;
        case 1:
            headView.SectionLabel.text=@"活动";
            headView.moreBtn.hidden=YES;
            break;
        case 2:
            headView.SectionLabel.text=@"心情";
            headView.moreBtn.hidden=YES;
            break;
        case 3:
            headView.SectionLabel.text=@"主题";
            headView.moreBtn.hidden=YES;
            break;
        case 4:
            headView.SectionLabel.text=@"语言";
            headView.moreBtn.hidden=YES;
            break;
        case 5:
            headView.SectionLabel.text=@"年代";
            headView.moreBtn.hidden=YES;
            break;
        case 6:
            headView.SectionLabel.text=@"曲风";
            headView.moreBtn.hidden=YES;
            break;
            
        default:
            break;
    }
    return headView;
    
    
    
    
    
    
    
}

//通过协议方法设置单元格尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(80,100);
    }
    else{
        
    return CGSizeMake(80,100);
        
    }
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(30, 30,20, 40);
    }else{
        return UIEdgeInsetsMake(30, 30, 10, 30);
    }
}


- (void)jumpToNextController{
    
    MoreSingerTableViewController *moreView = [[MoreSingerTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:moreView animated:YES];
    
    
    
    
}





@end
