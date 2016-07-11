//
//  PlayViewController.h
//  Music Player
//
//  Created by 李康 on 16/7/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,strong)NSDictionary *musicDic;


@property (nonatomic, assign) NSInteger musicIndex;

/**
 *  音乐数据
 */
@property (nonatomic, strong) NSArray *musics;

@end
