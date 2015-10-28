//
//  ChapterTableViewCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/26.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ChapterTableViewCell.h"

@implementation ChapterTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setChapterModel:(ChapterModel *)chapterModel
{
    self.titleLabel.text = chapterModel.title;
    self.wordCountLabel.text = [NSString stringWithFormat:@"%@字",chapterModel.word_count];
    self.imageCountLabel.text = [NSString stringWithFormat:@"%@图",chapterModel.image_count];
}

@end
