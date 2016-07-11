//
//  PlayTool.h
//  Music Player
//
//  Created by 李康 on 16/7/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Singleton.h"

@interface PlayTool : UIView

singleton_interface(PlayTool)

@property(nonatomic,strong)NSDictionary *musicPlayDic;
@property(nonatomic)BOOL isPlaying;
@property(strong,nonatomic)AVPlayer *player;
@property (weak, nonatomic) IBOutlet UIImageView *singImage;
@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UILabel *singerName;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *lastBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
/**
 *  歌曲总时间
 */
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLaber;
/**
 *  歌曲当前播放的时间
 */
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;

@property (weak, nonatomic) IBOutlet UILabel *curentTimeLabel;

/**
 *  定时器
 */
@property (nonatomic, strong) CADisplayLink *link;

+(instancetype)playerToolBar;
-(void)playing;
-(void)pause;
@end
