//
//  BookModel.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject


@property (nonatomic,strong) NSString *cover_url;//书皮
@property (nonatomic,strong) NSString *summary;//简介
@property (nonatomic,strong) NSString *title;//书名
@property (nonatomic,strong) NSString *ID;//拼接id
@property (nonatomic,strong) NSString *read_count;//阅读量
@property (nonatomic,strong) NSString *book_count;//书的本数


@end
