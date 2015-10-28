//
//  lastPageModel.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lastPageModel : NSObject

@property (nonatomic,strong) NSString *chapter_count;
@property (nonatomic,strong) NSString *comment_count;
@property (nonatomic,strong) NSString *cover_url;
@property (nonatomic,strong) NSString *favorer_count;
@property (nonatomic,strong) NSString *image_count;
@property (nonatomic,strong) NSString *first_chapter_id;
@property (nonatomic,strong) NSString *first_chapter_title;
@property (nonatomic,strong) NSString *first_chapter_url;
@property (nonatomic,strong) NSString *strID;
@property (nonatomic,strong) NSString *read_count;
@property (nonatomic,strong) NSString *share_count;
@property (nonatomic,strong) NSString *summary;
@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSMutableArray *tag_items;//书的类型数组
@property (nonatomic,strong) NSMutableArray *tag_words;//类型名数组
@property (nonatomic,strong) NSMutableArray *last_comments;//最新评论数组
@property (nonatomic,strong) NSDictionary *author_tag;
@property (nonatomic,strong) NSDictionary *pumpkin_info;

@end
