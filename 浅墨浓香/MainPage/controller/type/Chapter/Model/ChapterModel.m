//
//  ChapterModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/26.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ChapterModel.h"

@implementation ChapterModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        
        self.strID = value;
    }
}

@end
