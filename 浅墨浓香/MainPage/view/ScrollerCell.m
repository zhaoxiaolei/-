//
//  ScrollerCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ScrollerCell.h"
#import "ReauestData.h"
#import "MainModel.h"
#import "UIImageView+WebCache.h"
#import "LoveListTableViewController.h"

#define KchunAi @"http://i.itangyuan.com/book/tag/rank/67/choice.json?count=20&offset=0"
#define Kshiguang @"http://i.itangyuan.com/book/tag/rank/91/choice.json?count=20&offset=0"
#define KjingSong @"http://i.itangyuan.com/book/tag/rank/22/choice.json?count=20&offset=0"
#define KquanBu @"http://i.itangyuan.com/recommend/tag/official.json"



@implementation ScrollerCell

- (void)awakeFromNib {
    // Initialization code
}

//布局轮滑界面
- (void)layoutScroll
{
    NSMutableArray *viewsArray = [@[] mutableCopy];
    if ([ReauestData shareRequestData].carouselArr.count > 4){
    for (int i = 0; i < 4; ++i) {
            NSString *pic = [ReauestData shareRequestData].carouselArr[i];
            UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 150)];
            
            tempImageView.tag = 100 + i;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushAction:)];
            
            [tempImageView addGestureRecognizer:tap];
            
            tempImageView.userInteractionEnabled = YES;
            
           [tempImageView sd_setImageWithURL:[NSURL URLWithString:pic] placeholderImage:[UIImage imageNamed:@"back.png"]];
           [viewsArray addObject:tempImageView];
        
    }
    self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 150) animationDuration:5];
    self.mainScorllView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.1];
    [self.whiteView addSubview:_mainScorllView];
    
    self.mainScorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    self.mainScorllView.totalPagesCount = ^NSInteger(void){
        return 4;
    };
    }
}

//布局pageControl
-(void)layoutPageControl
{
    self.MainPage = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, self.whiteView.frame.size.width-10, 0)];
    _MainPage.center = CGPointMake(self.whiteView.frame.size.width/2, self.whiteView.frame.size.height - 10);
    _MainPage.userInteractionEnabled = NO;
    _MainPage.numberOfPages = 4;
    _MainPage.currentPageIndicatorTintColor = [UIColor blackColor];
    _MainPage.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.updateTime = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(appearpage) userInfo:self repeats:YES];
    [self.whiteView addSubview:_MainPage];
}


//获取page当前页
-(void)appearpage
{
    _MainPage.currentPage = [CurrentPage sharePage].currentCount;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)pushAction:(UITapGestureRecognizer *)tap
{
    NSInteger num = tap.view.tag;
   
    
    if (self.strIdArr.count != 0) {
        
      self.ID = self.strIdArr[num - 100];
        
    }
    [_delegate pushToLastPage:_ID];
}

//纯爱
- (IBAction)button1:(id)sender {
    
   
    [_delegate pushWithStrID:@"67"];

}
//时光
- (IBAction)button2:(id)sender {
    
    
    [_delegate pushWithStrID:@"91"];
}
//惊悚
- (IBAction)button3:(id)sender {
    
    [_delegate pushWithStrID:@"22"];
}
//全部分类
- (IBAction)button4:(id)sender {
    
    [_delegate push];
}


-(void)setArr:(NSMutableArray *)Arr
{
    _Arr = Arr;
    //布局轮滑界面
    [self layoutScroll];
    //布局pageControl
    [self layoutPageControl];
}

- (NSMutableArray *)strIdArr
{
    if (!_strIdArr) {
        
        self.strIdArr = [NSMutableArray array];
    }
    return _strIdArr;
}

@end
