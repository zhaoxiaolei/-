//
//  BookViewCell.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol bookViewCellDelegate <NSObject>

- (void)pushwithStr:(NSString *)str;

@end

@interface BookViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@property (nonatomic,weak) id<bookViewCellDelegate>delegate;

@end
