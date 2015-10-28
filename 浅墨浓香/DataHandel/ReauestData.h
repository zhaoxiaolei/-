//
//  ReauestData.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^myBlock)();

@interface ReauestData : NSObject

@property (nonatomic,strong) NSMutableArray *carouselArr;
@property (nonatomic,strong) NSMutableArray *bookArr;
@property (nonatomic,strong) NSMutableArray *storyArr;
@property (nonatomic,strong) NSMutableArray *carouselIds;
//纯爱等分类列表
@property (nonatomic,strong) NSMutableArray *loveListArr;
//全部分类
@property (nonatomic,strong) NSMutableArray *categoryArr;
//全部分类中 "更多分类"
@property (nonatomic,strong) NSMutableArray *moreArr;
//推荐书单个人分类列表
@property (nonatomic,strong) NSMutableArray *bookListArray;
//推荐书单总分类
@property (nonatomic,strong) NSMutableArray *bookCategoryArr;
//每日好故事总列表数据
@property (nonatomic,strong) NSMutableArray *storyCategoryArr;
@property (nonatomic,strong) NSMutableArray *storyListArr;

//书的简介
@property (nonatomic,strong) NSMutableArray *commentArr;

//目录
@property (nonatomic,strong) NSMutableArray *chapterArr;


+(ReauestData *)shareRequestData;

//请求数据
-(void)getDataWithUrl:(NSString *)url Block:(myBlock)block;

//请求首页推荐书单点击进入的列表数据
- (void)getBookListWithUrl:(NSString *)url Block:(myBlock)block;

//请求总分类数据
- (void)getCategoryDataWithUrl:(NSString *)url Block:(myBlock)block;
//请求总分类中的 "更多分类"的数据
- (void)getMoreCategoryDataWithUrl:(NSString *)url Block:(myBlock)block;

//请求推荐书单分类数据
- (void)getBookCategoryDataWithUrl:(NSString *)url Block:(myBlock)block;

//请求每日好故事总列表的数据
- (void)getStoryCategoryDataWithUrl:(NSString *)url Block:(myBlock)block;

//纯爱,时光等列表
- (void)getLoveListDataWithUrl:(NSString *)url Block:(myBlock)block;

//书的简介(最后一页)
- (void)getLastPageModelDataWithUrl:(NSString *)url Block:(myBlock)block;

//目录
- (void)getChapterDataWithUrl:(NSString *)url Block:(myBlock)block;

@end
