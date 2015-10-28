//
//  FourthCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "FourthCell.h"

#define KWidth ((self.frame.size.width*2 + 60 - 50)/ 6)
#define KSpace (((self.frame.size.width*2)/ 6) + 8)

@implementation FourthCell

- (void)awakeFromNib {
    // Initialization code
    
    self.backScroll.contentSize = CGSizeMake(self.frame.size.width*2+50, self.backScroll.frame.size.height);
    
    [self layoutImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//布局轮滑界面
- (void)layoutImageView
{
    for (int i = 0; i < 6; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake( 5+KSpace *i ,0, KWidth, self.backScroll.frame.size.height - 50)];
        imageView.backgroundColor = [UIColor greenColor];
        
        imageView.tag = 100 + i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushAction)];
        
        [imageView addGestureRecognizer:tap];
        
        [self.imageViewArr addObject:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5+KSpace * i, imageView.frame.size.height + 5, KWidth,20)];
        titleLabel.text = @"title";
        
        [self.titleArr addObject:titleLabel];
        
        UILabel *nicnameLable = [[UILabel alloc] initWithFrame:CGRectMake(5+KSpace * i, imageView.frame.size.height + 28, KWidth,15)];
        nicnameLable.text = @"nicname";
        nicnameLable.font = [UIFont systemFontOfSize:12];
        nicnameLable.textColor = [UIColor grayColor];
        
        [self.nicnameArr addObject:nicnameLable];
        
        [self.backScroll addSubview:nicnameLable];
        [self.backScroll addSubview:titleLabel];
        [self.backScroll addSubview:imageView];
    }
    
}
- (NSMutableArray *)imageViewArr
{
    if (!_imageViewArr) {
        
        self.imageViewArr = [NSMutableArray array];
    }
    
    return _imageViewArr;
}
- (NSMutableArray *)titleArr
{
    if (!_titleArr) {
        
        self.titleArr = [NSMutableArray array];
    }
    return _titleArr;
}
- (NSMutableArray *)nicnameArr
{
    if (!_nicnameArr) {
        
        self.nicnameArr = [NSMutableArray array];
    }
    return _nicnameArr;
}
- (void)pushAction
{
    
}

@end
