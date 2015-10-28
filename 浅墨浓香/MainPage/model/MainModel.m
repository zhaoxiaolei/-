//
//  MainModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"booklists"]) {
//        for (NSDictionary *dic in value) {
//            //解析
//        }
    }else if([key isEqualToString:@"carousel"]){
        for (NSDictionary *dic in value) {
            NSString *pic = [dic valueForKey:@"image"];
            [_carouselArr addObject:pic];
        }
    }
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    
}

-(NSMutableArray *)bookListArr
{
    if (! _bookListArr) {
        _bookListArr = [NSMutableArray array];
    }
    return _bookListArr;
}

-(NSMutableArray *)carouselArr
{
    if (! _carouselArr) {
        _carouselArr = [NSMutableArray array];
    }
    return _carouselArr;
}



@end
