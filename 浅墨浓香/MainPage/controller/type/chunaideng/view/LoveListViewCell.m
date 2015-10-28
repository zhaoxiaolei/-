//
//  LoveListViewCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoveListViewCell.h"
#import "UIImageView+WebCache.h"

@implementation LoveListViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLoveModel:(LoveListModel *)loveModel
{
    [self.bookImage sd_setImageWithURL:[NSURL URLWithString:loveModel.cover_url]];
    self.nicknameLabel.text = loveModel.nickname;
    self.titleLabel.text = loveModel.name;
    self.countLabel.text = [NSString stringWithFormat:@"%@阅读/%@评论/%@收藏",loveModel.read_count,loveModel.comment_count,loveModel.favorer_count];
}

@end
