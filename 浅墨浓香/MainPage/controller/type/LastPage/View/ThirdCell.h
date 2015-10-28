//
//  ThirdCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface ThirdCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *authorImage;

@property (weak, nonatomic) IBOutlet UILabel *nicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@property (nonatomic,strong) CommentModel *model;

@end
