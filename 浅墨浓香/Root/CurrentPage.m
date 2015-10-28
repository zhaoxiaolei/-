//
//  CurrentPage.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CurrentPage.h"

@implementation CurrentPage
+(CurrentPage *)sharePage
{
    static CurrentPage *page = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        page = [[CurrentPage alloc] init];
    });
    return page;
}

@end
