//
//  PlayViewController.m
//  Music Player
//
//  Created by 李康 on 16/7/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "PlayViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "NetWork.h"
#import "UIImageView+WebCache.h"
#import "PlayTool.h"
#import "AppDelegate.h"
#import <MediaPlayer/MediaPlayer.h>


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface PlayViewController ()

//@property(strong,nonatomic)AVPlayer *player;

@property (weak, nonatomic) IBOutlet UIImageView *singerImageView;
@property (strong, nonatomic) NetWork * netWork;
@property(strong,nonatomic)NSArray *music;//请求得到的字典
@property(nonatomic,strong)NSString *getUrl;
@property(strong,nonatomic) PlayTool *toolBar;
@property(strong,nonatomic) NSArray *lrcArr;
@property(strong,nonatomic)NSString *lrcUrl;//歌词

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property(assign,nonatomic)int charNum ;
@property(assign,nonatomic)int readedChar;
@property(assign,nonatomic) int rowNum;//歌词的滚动
@property(assign,nonatomic) int order;

/**
 *  定时器
 */
@property (nonatomic, strong) CADisplayLink *link;



@end

@implementation PlayViewController

-(CADisplayLink *)link
{
    if (_link == nil) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    }
    return _link;
}


-(void)update{
    
    
    NSInteger second = CMTimeGetSeconds(self.toolBar.player.currentTime) ;
    NSString *tm = [NSString stringWithFormat:@"%ld",(long)second];
    

    //NSLog(@"%@",tm);
    
    NSInteger wholeTime = [self.toolBar.musicPlayDic[@"songurl"][@"url"][1][@"file_duration"] intValue];
   
    
    
    
    for (int i =0; i<[self.lrcArr count]; i++) {
        
        _charNum =_charNum+(int)[self.lrcArr[i] length];
        
    }
    
   
    double i=[tm doubleValue]/(double)wholeTime;
    
    
    _order = i*_charNum;
    
    //NSLog(@"%d",_order);
    if (i>0) {
        
         self.rowNum = i*[self.lrcArr count];
    }
    
   
//    for (int i = 0; i<[self.lrcArr count]; i++) {
//        
//        self.readedChar+=(int)[self.lrcArr[i] length];
//  
//        
//        if (self.readedChar>_order) {
//            self.rowNum = i;
//            NSLog(@"%d",self.rowNum);
//            break;
//        }
//    }
    
        [self.pickerView selectRow:self.rowNum inComponent:0 animated:YES];
    
    [self.pickerView reloadComponent:0];
    
//    if ([tm intValue]>0) {
//        
//        [self.pickerView selectRow:[tm intValue] inComponent:0 animated:YES];
//        
//
//        NSLog(@"%d",[tm intValue]);
//    }
    
    self.charNum = 0;
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.netWork = [NetWork network];

   [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];
   
    self.charNum = 0;
    self.readedChar = 0;
    
    //[self.toolBar removeFromSuperview];
   
    //if (!self.toolBar) {
        
        self.toolBar = [PlayTool playerToolBar];
        
        self.toolBar.frame = CGRectMake(0, self.pickerView.frame.origin.y+self.pickerView.frame.size.height,self.pickerView.frame.size.width, kScreenHeight-self.singerImageView.frame.size.height-self.pickerView.frame.size.height);
      
        [self.view addSubview:self.toolBar];
        
    //}else{
        
//        [self.toolBar.player replaceCurrentItemWithPlayerItem:[[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:self.toolBar.musicPlayDic[@"songurl"][@"url"][1][@"file_link"]]]];
//        
//    }
   
    [self getInfo];
    
    self.pickerView.backgroundColor = [UIColor clearColor];
    
    
    
}




-(void)previous{
    //1.更改播放音乐的索引
    if (self.musicIndex == 0) {
        self.musicIndex = self.musics.count - 1;
    }else{
        self.musicIndex--;
    }
    [self getInfo];
}

#pragma mark 播放下一首
-(void)next:(NSNotification *)notification{
    //1.更改播放音乐的索引
    if (self.musicIndex == self.musics.count - 1) {
        self.musicIndex = 0;
    }
    else{
        self.musicIndex++;
    }
    [self getInfo];
   
}

- (void)getInfo
{
    
    NSString *tmpStr =[NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.getInfos&ts=1445484488&songid=%@",self.musics[_musicIndex][@"song_id"]];
    
    NSString *tmpStr2 = @"&nw=2&l2p=0&lpb=0&ext=mp3&format=json&from=ios&usup=1&lebo=0&aac=0&ucf=4&vid=&res=1&e=USbMxKUnchkbhCYmky%2B5RJ%2FpxskZMYC1wjYkv8AHsvo%3D&version=5.3.2&from=ios&channel=appstore";
        [self.netWork getObjectWithUrl:[tmpStr stringByAppendingString:tmpStr2]
     

           Success:^(NSDictionary * dict) {
               
                NSLog(@"XXXXXXXXXXXXXXXXXXXXX-------------------------XXXXXXXXXXXXXXXXXXXXX%@",dict);
               
               self.getUrl =dict[@"songurl"][@"url"][1][@"file_link"];
               
               self.toolBar.musicPlayDic = dict;
               self.lrcUrl = dict[@"songinfo"][@"lrclink"];
               [[NSNotificationCenter defaultCenter]postNotificationName:@"NewDic" object:nil userInfo:dict];
               
               
               [self.singerImageView sd_setImageWithURL:[NSURL URLWithString:dict[@"songinfo"][@"pic_big"]]];
              
                              
               [self.toolBar.singImage sd_setImageWithURL:[NSURL URLWithString:dict[@"songinfo"][@"pic_small"]]];
               
               
               self.toolBar.singImage.layer.masksToBounds = YES;
               
               self.toolBar.singImage.layer.cornerRadius = self.toolBar.singImage.frame.size.width/2;
               
               self.toolBar.songName.text =dict[@"songinfo"][@"title"];
               
               self.toolBar.singerName.text = dict[@"songinfo"][@"author"];
               
               self.toolBar.timeSlider.value = 0;
               
               self.toolBar.timeSlider.maximumValue =[dict[@"songurl"][@"url"][1][@"file_duration"] floatValue];
               
               [self getLrc];
               
           } failure:^(NSError *err) {
               
              // NSLog(@"%@",err);
               
           }];
    
}

-(void)getLrc{
    
    
    NSString *tmpStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:self.lrcUrl] encoding:4 error:nil];
    NSLog(@"%@",tmpStr);
    
    NSArray *tmpArr= [tmpStr componentsSeparatedByString:@"\n"];
    NSMutableArray *tm = [NSMutableArray array];
    
    for (int i = 0; i<[tmpArr count]; i++) {
        if ([tmpArr[i] length]>10) {
            NSString *str = [tmpArr[i] substringFromIndex:10];
            [tm addObject:str];
            
        }else{
            
            [tm addObject:tmpArr[i]];
        }
        
        
        
        
    }
    
    self.lrcArr = [NSArray arrayWithArray:tm];
    
    
    
    [self.pickerView reloadComponent:0];
    
    NSLog(@"%@",self.lrcArr[4]);
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(next:) name:@"Next" object:nil];
    
    
    //if (self.toolBar.isPlaying) {
        
        [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        
   // }
    
    
    
    
}

-(void)dealloc
{
    //移除定时器
    [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - uipickerview data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 35;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [self.lrcArr count];
    
}


-(NSString * )pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    
    
    NSString *str=[self.lrcArr objectAtIndex:row];
    
  
    return str;
    
    
    
}







@end
