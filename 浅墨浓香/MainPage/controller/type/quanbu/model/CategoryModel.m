//
//  CategoryModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        
        self.StrId = value;
    }
}

@end
