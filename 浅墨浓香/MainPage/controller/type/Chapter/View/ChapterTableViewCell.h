//
//  ChapterTableViewCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/26.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChapterModel.h"

@interface ChapterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *wordCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *imageCountLabel;

@property (nonatomic,strong) ChapterModel *chapterModel;

@end
