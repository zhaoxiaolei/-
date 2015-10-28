//
//  ThirdCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ThirdCell.h"
#import "UIImageView+WebCache.h"

@implementation ThirdCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(CommentModel *)model
{

        [self.authorImage sd_setImageWithURL:[NSURL URLWithString:model.authorImage]];
        
        self.authorImage.layer.masksToBounds = YES;
        self.authorImage.layer.cornerRadius = self.authorImage.frame.size.height/2;
        
        self.nicNameLabel.text = model.nickName;
        
        self.summaryLabel.text = model.content;

}

@end
