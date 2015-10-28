//
//  StoryListModel.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryListModel : NSObject

@property (nonatomic,strong) NSString *date_str;//时间
@property (nonatomic,strong) NSMutableDictionary *author_tag;//作者简介
@property (nonatomic,strong) NSString *cover_url;//书的封面
@property (nonatomic,strong) NSString *recommend_text;//描述文字
@property (nonatomic,strong) NSString *release_time_str;//更新时间
@property (nonatomic,strong) NSString *release_time_value;//有效时间
@property (nonatomic,strong) NSString *title;//书名
@property (nonatomic,strong) NSString *strID;//拼接id
@end
