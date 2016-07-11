//
//  PlayTool.m
//  Music Player
//
//  Created by 李康 on 16/7/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "PlayTool.h"


@implementation PlayTool


singleton_implementation(PlayTool)






+(instancetype)playerToolBar
{
    
    
    
    return [[[NSBundle mainBundle] loadNibNamed:@"PlayTool" owner:nil options:nil]lastObject];
    
    
}

-(CADisplayLink *)link
{
    if (_link == nil) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    }
    return _link;
}

-(void)update{
    
    if (self.isPlaying) {
        //1.更新进度条
        
        NSInteger second = CMTimeGetSeconds(self.player.currentTime);
        
        self.timeSlider.value = second;
       
        
        NSString *min = [NSString stringWithFormat:@"0%ld:",second/60];
        
        NSString *sec = [NSString stringWithFormat:@"%ld",second%60];
        
        if ([sec intValue]<9) {
            sec = [@"0" stringByAppendingString:sec];
        }
        
        self.curentTimeLabel.text = [min stringByAppendingString:sec];
        

    }
    
    CGFloat angle = M_PI_4 / 60;
    self.singImage.transform = CGAffineTransformRotate(self.singImage.transform, angle);
    
    
    
}

//+(NSString *)getMinuteSecondWithSecond:(NSTimeInterval)time{
//    
//    int minute = (int)time / 60;
//    int second = (int)time % 60;
//    
//    if (second > 9) {
//        return [NSString stringWithFormat:@"%d:%d",minute,second];
//    }
//    return [NSString stringWithFormat:@"%d:0%d",minute,second];
//}

-(void)dealloc
{
    //移除定时器
    [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (IBAction)play:(id)sender {
    //开启定时器
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

    
    [self playing];
    

}


-(void)playing{
    
    if (self.player == nil) {
        
        self.player = [[AVPlayer alloc]initWithPlayerItem:[[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:self.musicPlayDic[@"songurl"][@"url"][1][@"file_link"]]]];
        
    }
    
    
    
    
    NSString *min = [NSString stringWithFormat:@"0%d:",[self.musicPlayDic[@"songurl"][@"url"][1][@"file_duration"] intValue]/60];
    
    NSString *sec = [NSString stringWithFormat:@"%d",[self.musicPlayDic[@"songurl"][@"url"][1][@"file_duration"] intValue]-60*([self.musicPlayDic[@"songurl"][@"url"][1][@"file_duration"] intValue]/60)];
    
    self.totalTimeLaber.text = [min stringByAppendingString:sec];
    


    
    if (self.isPlaying ==NO) {
        
        
        [self.player play];
        
        
        
        
        self.isPlaying =YES;
        
        [self.playBtn setImage:[UIImage imageNamed:@"playbar_pausebtn_nomal@2x"] forState:UIControlStateNormal];
        
        //        CGFloat angle = M_PI_4 / 60;
        //        self.singImage.transform = CGAffineTransformRotate(self.singImage.transform, angle);
        //
        
    }else{
        
        [self.player pause];
        
        self.isPlaying =NO;
        
        [self.playBtn setImage:[UIImage imageNamed:@"playbar_playbtn_click@2x"] forState:UIControlStateNormal];
        
    }
    

    
    
}


-(void)getNew:(NSNotification *)notification{
    
    
    self.musicPlayDic = notification.userInfo;
    
    
}

- (IBAction)nextSong:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Next" object:nil];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getNew:) name:@"NewDic" object:nil];
    
    self.player = [[AVPlayer alloc]initWithPlayerItem:[[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:self.musicPlayDic[@"songurl"][@"url"][1][@"file_link"]]]];
    
    if (self.isPlaying ==NO) {
        
        
        [self.player play];
        
        self.isPlaying =YES;
        
        [self.playBtn setImage:[UIImage imageNamed:@"playbar_pausebtn_nomal@2x"] forState:UIControlStateNormal];
        
        //        CGFloat angle = M_PI_4 / 60;
        //        self.singImage.transform = CGAffineTransformRotate(self.singImage.transform, angle);
        //
        
    }else{
        
        [self.player pause];
        
        self.isPlaying =NO;
        
        [self.playBtn setImage:[UIImage imageNamed:@"playbar_playbtn_click@2x"] forState:UIControlStateNormal];
        
    }
    
    
}

-(void)pause{
    
    [self.player pause];
    
}
@end
