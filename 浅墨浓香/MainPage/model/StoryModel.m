//
//  StoryModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "StoryModel.h"

@implementation StoryModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"target"]) {
        self.ID = [value substringFromIndex:11];
    }
}

@end
