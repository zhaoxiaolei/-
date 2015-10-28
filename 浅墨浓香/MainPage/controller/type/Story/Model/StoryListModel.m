//
//  StoryListModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "StoryListModel.h"

@implementation StoryListModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"target"]) {
        
        self.strID = [value substringFromIndex:10];
    }
}

@end
