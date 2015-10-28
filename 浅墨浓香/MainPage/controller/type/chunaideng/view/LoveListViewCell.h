//
//  LoveListViewCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoveListModel.h"

@interface LoveListViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (nonatomic,strong) LoveListModel *loveModel;

@end
