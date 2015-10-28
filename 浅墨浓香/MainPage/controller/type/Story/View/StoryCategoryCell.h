//
//  StoryCategoryCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryListModel.h"

@interface StoryCategoryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bookCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (nonatomic,strong) StoryListModel *model;
@end
