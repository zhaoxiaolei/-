//
//  BookListCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookListModel.h"

@interface BookCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *decriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *nicNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bookImage;

@property (nonatomic,strong)BookListModel *model;

@end
