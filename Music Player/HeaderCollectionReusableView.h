//
//  HeaderCollectionReusableView.h
//  播放应用
//
//  Created by zkftjs on 16/7/4.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeaderCollectionReusableView;
@protocol headerViewDelegate <NSObject>

@optional
- (void)jumpToNextController;

@end

@interface HeaderCollectionReusableView : UICollectionReusableView
@property (strong,nonatomic)UILabel *SectionLabel;
@property (nonatomic,strong)id<headerViewDelegate> delegate;
@property (strong,nonatomic)UIButton * moreBtn;

@end
