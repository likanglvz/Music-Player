//
//  MyViewController.m
//  Music Player
//
//  Created by 李康 on 16/6/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "MyViewController.h"
#import "PagerItem.h"
#import "MyTableViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SELECTED_COLOR [UIColor redColor]
#define KTitleH 30

static NSString *ID=@"pager";
@interface MyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>



@property (nonatomic, strong) UIView *titleWrap;

@property (nonatomic, assign) CGFloat titleHeight;

@property (nonatomic, strong) NSMutableArray *itemArr;

@property (nonatomic, weak) UIView *sliderView;


@property (nonatomic, assign) NSInteger oldSelectedIndex;
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, strong) UICollectionView *pagerContainer;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的音乐";
    self.titleArr = @[@"歌曲列表",@"下载列表",@"最近播放",@"设置"];
    
    //解决nav bar遮挡的问题
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
    }
    
    MyTableViewController *tb1=[[MyTableViewController alloc]init];
    MyTableViewController *tb2=[[MyTableViewController alloc]init];
    MyTableViewController *tb3=[[MyTableViewController alloc]init];
    MyTableViewController *tb4=[[MyTableViewController alloc]init];
    
    self.controllerArr = @[tb1,tb2,tb3,tb4];
    
    
    
    
    [self initTitleWrap];
}

-(void)initTitleWrap{
    CGFloat itemW = (CGFloat)SCREEN_WIDTH/_titleArr.count;
    //标题容器
    UIView *titleWrap = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, KTitleH)];
    titleWrap.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
    [self.view addSubview:titleWrap];
    _titleWrap = titleWrap;
    
    _itemArr = [NSMutableArray array];
    for (int i = 0; i < self.titleArr.count; i++) {
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [itemButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [itemButton setTitle:_titleArr[i] forState:UIControlStateNormal];
        //        [itemButton setTitleColor:SELECTED_COLOR forState:UIControlStateSelected];
        [itemButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        itemButton.frame = CGRectMake(itemW*i, 0, itemW, KTitleH);
        itemButton.tag = i;
        [itemButton addTarget:self action:@selector(scrollToSelectedIndex:) forControlEvents:UIControlEventTouchUpInside];
        [titleWrap addSubview:itemButton];
        //[self.view addSubview:self.controllerArr[i]];
        
        [_itemArr addObject:itemButton];
    }
    
    //添加滑块
    UIView *sliderV=[[UIView alloc]initWithFrame:CGRectMake(0, KTitleH-2, itemW, 2)];
    sliderV.backgroundColor=SELECTED_COLOR;
    [self.titleWrap addSubview:sliderV];
    _sliderView=sliderV;
    
    [self scrollToSelectedIndex:self.itemArr[0]];
}

-(void)scrollToSelectedIndex:(UIButton *) item{
    
    
    [self selectButton:item.tag];
    
    //滚动到选中页面
    [UIView animateWithDuration:0.3 animations:^{
        self.pagerContainer.contentOffset = CGPointMake(SCREEN_WIDTH*item.tag, 0);
        
    }];
    
    //保存选中索引
    self.oldSelectedIndex = item.tag;
    
}

-(void)selectButton:(NSInteger )index{
    //取消选中上一个
    [self.itemArr[self.oldSelectedIndex] setSelected:NO];
    //选中当前
    [self.itemArr[index] setSelected:YES];
    
    CGFloat itemW = (CGFloat)SCREEN_WIDTH/_titleArr.count;
    
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.sliderView.frame=CGRectMake(itemW*index, KTitleH-2, itemW, 2);
        [[self.itemArr[_oldSelectedIndex] titleLabel] setFont:[UIFont systemFontOfSize:16]];
        [[self.itemArr[index] titleLabel] setFont:[UIFont systemFontOfSize:16]];
    } completion:^(BOOL finished) {
        
    }];
    
    //记录当前选中
    self.oldSelectedIndex = index;
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.controllerArr.count;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PagerItem  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    UITableViewController *tableVc = self.controllerArr[indexPath.item];
    
    
    //判断是否有导航栏来确定内容的高度
    if (self.navigationController.navigationBar) {
        
        tableVc.view.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-KTitleH);
    }else{
        tableVc.view.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-KTitleH);
    }
    cell.content = tableVc.view;
    
    return cell;
    
}


@end
