//
//  FirstRowCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "FirstRowCell.h"

@implementation FirstRowCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(BookModel *)model
{
    self.bookNameLabel.text = model.title;
    self.readCountLabel.text = [NSString stringWithFormat:@"%@部作品/%@阅读",model.book_count,model.read_count];
    self.descriptionLabel.text = model.summary;
}

@end
