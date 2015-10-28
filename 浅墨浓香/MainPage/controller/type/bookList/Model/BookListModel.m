//
//  BookListModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "BookListModel.h"

@implementation BookListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"book"]) {
        
        NSDictionary *authorDic = [value valueForKey:@"author_tag"];
        
        self.nickname = [authorDic valueForKey:@"nickname"];
        
        self.cover_url = [value valueForKey:@"cover_url"];
        
        self.name = [value valueForKey:@"name"];
    }
}

@end
