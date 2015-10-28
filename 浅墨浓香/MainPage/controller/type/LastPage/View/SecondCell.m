//
//  SecondCell.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "SecondCell.h"

@implementation SecondCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(lastPageModel *)model
{
    self.contentLabel.text = model.summary;
    
    self.countLabel.text = [NSString stringWithFormat:@"作品评论(%@)",model.comment_count];
}

- (IBAction)btAction1:(id)sender {
}

- (IBAction)btAction2:(id)sender {
}

- (IBAction)btAction3:(id)sender {
}

@end
