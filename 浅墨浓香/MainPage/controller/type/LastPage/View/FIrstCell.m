//
//  FIrstCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "FIrstCell.h"
#import "UIImageView+WebCache.h"
#import "lastPageModel.h"

@interface FIrstCell ()

@property (nonatomic,strong)lastPageModel *lastModel;

@end

@implementation FIrstCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(lastPageModel *)model
{
    [self.bookCoverImage sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];
    [self.authorImage sd_setImageWithURL:[NSURL URLWithString:[model.author_tag valueForKey:@"avatar_url"]]];
    
    self.authorImage.layer.masksToBounds = YES;
    self.authorImage.layer.cornerRadius = self.authorImage.frame.size.height/2;
    
    self.titleLabel.text = model.name;
    
    self.nicnameLabel.text = [model.author_tag valueForKey:@"nickname"];
    
    self.countLabel.text = [NSString stringWithFormat:@"%@阅读/%@字/%@图/0小时前更新",model.read_count,[model.author_tag valueForKey:@"book_word_count"],model.image_count];
    
    self.label1.text = [NSString stringWithFormat:@"%@",[model.pumpkin_info valueForKey:@"count"]];
    
    self.label2.text = [NSString stringWithFormat:@"%@", model.favorer_count];

    self.label3.text = [NSString stringWithFormat:@"%@", model.share_count];
    
    NSLog(@"%@",model.strID);
    
    [self.chaptherBt.layer setBorderWidth:0.5];
    
    [self.chaptherBt.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    self.lastModel = model;
}

- (IBAction)catalogPush:(id)sender {
    
    [_delegate pushToChapterWithModel:self.lastModel];
    
}

- (IBAction)readPush:(id)sender {
}


@end
