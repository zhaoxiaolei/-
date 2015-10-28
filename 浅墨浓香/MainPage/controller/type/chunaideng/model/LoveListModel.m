//
//  LoveListModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoveListModel.h"

@implementation LoveListModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"author_tag"]) {
        
        self.nickname = [value valueForKey:@"nickname"];
        self.cover_url = [value valueForKey:@"cover_url"];
    }
}


@end
