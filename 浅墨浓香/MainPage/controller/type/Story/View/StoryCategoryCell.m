//
//  StoryCategoryCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "StoryCategoryCell.h"
#import "UIImageView+WebCache.h"

@implementation StoryCategoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(StoryListModel *)model
{
    self.descriptionLabel.text = model.recommend_text;
    self.titleLabel.text = model.title;
    [self.bookCoverImage sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];
}

@end
