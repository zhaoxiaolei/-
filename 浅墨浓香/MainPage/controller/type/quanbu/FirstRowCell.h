//
//  FirstRowCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"

@interface FirstRowCell : UITableViewCell

@property (nonatomic,strong) BookModel *model;

@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *readCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
