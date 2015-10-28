//
//  MoreCategoryModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MoreCategoryModel.h"

@implementation MoreCategoryModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        
        self.strID = value;
    }
}

@end
