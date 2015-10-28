//
//  CategoryViewCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"

@interface CategoryViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bookImage;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIView *uiVIew;

@property (nonatomic,strong) CategoryModel *model;
@end
