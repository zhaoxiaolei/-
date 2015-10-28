//
//  CategoryViewCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CategoryViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CategoryViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(CategoryModel *)model
{
    [self.bookImage sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];
    
    [self.bookImage layoutIfNeeded];
    self.bookImage.layer.masksToBounds = YES;
    self.bookImage.layer.cornerRadius = self.bookImage.frame.size.height/2;
    
    self.categoryLabel.text = model.tag;
    
    self.countLabel.text = [NSString stringWithFormat:@"%@部作品",model.count];
    
}

@end
