//
//  ChapterModel.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/26.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChapterModel : NSObject

@property (nonatomic,strong) NSString *title;//章节题目
@property (nonatomic,strong) NSString *word_count;//字数
@property (nonatomic,strong) NSString *image_count;//图数
@property (nonatomic,strong) NSString *strID;//拼接章节ID

@end
