//
//  BookCategoryModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "BookCategoryModel.h"

@implementation BookCategoryModel
- (void) setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        
        self.ID = value;
    }
}

@end
