//
//  BookListModel.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookListModel : NSObject

@property (nonatomic,strong) NSString *nickname;//作者名
@property (nonatomic,strong) NSString *name;//书名
@property (nonatomic,strong) NSString *explication;//描述
@property (nonatomic,strong) NSString *cover_url;//书皮
@property (nonatomic,strong) NSString *book_id;//书跳转界面的id;

@end
