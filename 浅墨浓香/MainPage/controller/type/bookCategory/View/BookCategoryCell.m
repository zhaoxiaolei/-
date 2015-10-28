//
//  BookCategoryCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "BookCategoryCell.h"
#import "UIImageView+WebCache.h"

@implementation BookCategoryCell

- (void)awakeFromNib {
    // Initialization code
}
//通过model给cell中的控件赋值
- (void)setModel:(BookCategoryModel *)model
{
    [self.bookCoverImage sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];
    self.titleLabel.text = model.title;
    
}

@end
