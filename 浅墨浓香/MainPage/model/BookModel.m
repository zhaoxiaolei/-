//
//  BookModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}


@end
