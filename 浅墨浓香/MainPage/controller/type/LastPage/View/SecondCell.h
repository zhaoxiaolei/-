//
//  SecondCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lastPageModel.h"

@interface SecondCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (nonatomic,strong) lastPageModel *model;

@end
