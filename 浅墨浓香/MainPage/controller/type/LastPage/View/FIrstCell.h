//
//  FIrstCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lastPageModel.h"

@protocol FirstCellDelegate <NSObject>

- (void)pushToChapterWithModel:(lastPageModel *)model;

@end

@interface FIrstCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *bookCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *authorImage;

@property (weak, nonatomic) IBOutlet UILabel *nicnameLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;

@property (weak, nonatomic) IBOutlet UIImageView *image3;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (nonatomic,strong) lastPageModel *model;

@property (weak, nonatomic) IBOutlet UIButton *chaptherBt;


@property (nonatomic,weak) id<FirstCellDelegate>delegate;

@end
