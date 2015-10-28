//
//  ScrollerCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleScrollView.h"
#import "NSTimer+Addition.h"
#import "CurrentPage.h"

@protocol scrollerCellDelegate <NSObject>

- (void)pushWithStrID:(NSString *)strID;

- (void)push;

- (void)pushToLastPage:(NSString *)strID;
@end



@interface ScrollerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *whiteView;

@property (nonatomic,strong) CycleScrollView * mainScorllView;
@property (nonatomic,strong) UIPageControl *MainPage;
@property (nonatomic,strong) NSTimer *updateTime;

@property (nonatomic,strong) NSMutableArray *Arr;
@property (nonatomic,strong) UILabel *tempLabel;

@property (nonatomic,strong) NSMutableArray *viewsArray;

@property (nonatomic,weak) id<scrollerCellDelegate>delegate;


@property (nonatomic,strong)NSString *pinjieID;

@property (nonatomic,strong) NSMutableArray *strIdArr;

@property (nonatomic,strong) NSString *ID;

@end
