//
//  lastPageModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "lastPageModel.h"

@implementation lastPageModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        
        self.strID = value;
    }
    
}

@end
