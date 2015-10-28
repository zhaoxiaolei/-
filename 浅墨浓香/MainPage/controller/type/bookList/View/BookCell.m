//
//  BookListCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "BookCell.h"
#import "UIImageView+WebCache.h"
@implementation BookCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(BookListModel *)model
{
    self.bookNameLabel.text = model.name;
    self.decriptionLabel.text = model.explication;
    self.nicNameLabel.text = [NSString stringWithFormat:@"by %@",model.nickname];
    
    [self.bookImage sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];
}

@end
