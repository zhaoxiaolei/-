//
//  ReauestData.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ReauestData.h"
#import "AFNetworking.h"
#import "BookModel.h"
#import "StoryModel.h"
#import "LoveListModel.h"
#import "CategoryModel.h"
#import "BookListModel.h"
#import "BookCategoryModel.h"
#import "StoryCategoryModel.h"
#import "StoryListModel.h"
#import "MoreCategoryModel.h"
#import "lastPageModel.h"
#import "CommentModel.h"
#import "ChapterModel.h"
@interface ReauestData ()

@end

@implementation ReauestData


+(ReauestData *)shareRequestData
{
    static ReauestData *request = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[ReauestData alloc] init];
    });
    return request;
}

//请求数据
-(void)getDataWithUrl:(NSString *)url Block:(myBlock)block
{
    //开辟子线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //子线程 请求数据
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
        
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            //获取数据
            NSDictionary *dic = responseObject;
            NSDictionary *dataDic = [dic valueForKey:@"data"];
            
            self.carouselIds = [NSMutableArray array];
            //轮播图
            NSMutableArray *carousel = [dataDic valueForKey:@"carousel"];
            for (NSDictionary *mindaic in carousel) {
                NSString *pic = [mindaic valueForKey:@"image"];
                [self.carouselArr addObject:pic];
                NSString *ID = [mindaic valueForKey:@"target"];
                NSArray *array = [ID componentsSeparatedByString:@"/"];
                [self.carouselIds addObject:[array lastObject]];
                
            }
            
            //推荐书单
            self.bookArr = [NSMutableArray array];
            NSMutableArray *bookListArr = [dataDic valueForKey:@"booklists"];
            for (NSDictionary *dd in bookListArr) {
                BookModel *model = [BookModel new];
                [model setValuesForKeysWithDictionary:dd];
                [self.bookArr addObject:model];
            }
            
            //每日好故事
            self.storyArr = [NSMutableArray array];
            NSMutableArray *storyListArr = [dataDic valueForKey:@"dailystory"];
            NSDictionary *valueDic = [storyListArr firstObject];
            NSMutableArray *arr = [valueDic valueForKey:@"item_list"];
            for (NSDictionary *dd in arr) {
                StoryModel *model = [StoryModel new];
                [model setValuesForKeysWithDictionary:dd];
                [self.storyArr addObject:model];
            }
            
            
            //回归主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                block();
            });
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error:%@",error);
            
        }];
    });
}
//纯爱,时光等列表
- (void)getLoveListDataWithUrl:(NSString *)url Block:(myBlock)block
{
    [self.loveListArr removeAllObjects];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *Dic = responseObject;
        NSDictionary *dataDic = [Dic valueForKey:@"data"];
        
        //纯爱王道
        NSMutableArray *loveArr = [dataDic valueForKey:@"books"];
        
        for (NSDictionary *dic in loveArr) {
            
            LoveListModel *loveModel = [LoveListModel new];
            
            [loveModel setValuesForKeysWithDictionary:dic];
            
            [self.loveListArr addObject:loveModel];
        }
        //回归主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block(self.loveListArr);
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

//请求首页每日好故事数据
- (void)getBookListWithUrl:(NSString *)url Block:(myBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *Dic = responseObject;
        NSDictionary *dataDic = [Dic valueForKey:@"data"];
        
        //推荐书单点击进入的书单列表
        self.bookListArray = [NSMutableArray array];
        NSArray *itemsArr = [dataDic valueForKey:@"items"];
        
        for (NSDictionary *dic in itemsArr) {
            
            BookListModel *model = [BookListModel new];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.bookListArray addObject:model];
        }
        //回归主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block();
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

//请求总分类数据
- (void)getCategoryDataWithUrl:(NSString *)url Block:(myBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dataDic = responseObject;
        NSArray *dataArr = [dataDic valueForKey:@"data"];
        //总分类
        self.categoryArr = [NSMutableArray array];
        
       // NSLog(@"ueihfjsd bft%@",dataArr);
        
        for (NSDictionary *dic in dataArr) {
            
            CategoryModel *model = [CategoryModel new];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.categoryArr addObject:model];
        }
        
        //回归主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block();
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

//请求总分类中的 "更多分类"的数据
- (void)getMoreCategoryDataWithUrl:(NSString *)url Block:(myBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dataDic = responseObject;
        NSArray *dataArr = [dataDic valueForKey:@"data"];
       
        for (NSDictionary *dic in dataArr) {
            
            MoreCategoryModel *model = [MoreCategoryModel new];
            [model setValuesForKeysWithDictionary:dic];
            
            [self.moreArr addObject:model];
        }
        
        //回归主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block();
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}

//请求推荐书单分类数据
- (void)getBookCategoryDataWithUrl:(NSString *)url Block:(myBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *Dic = responseObject;
        NSDictionary *dataDic = [Dic valueForKey:@"data"];
        //总分类
        self.categoryArr = [NSMutableArray array];
        
        // NSLog(@"ueihfjsd bft%@",dataArr);
        
        //推荐书单总分类
        self.bookCategoryArr = [NSMutableArray array];
        NSArray *bookArr = [dataDic valueForKey:@"booklists"];
        
        for (NSDictionary *dic in bookArr) {
            
            BookCategoryModel *model = [BookCategoryModel new];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.bookCategoryArr addObject:model];
        }        //回归主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block();
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

//请求每日好故事总列表的数据
- (void)getStoryCategoryDataWithUrl:(NSString *)url Block:(myBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *Dic = responseObject;
        NSDictionary *dataDic = [Dic valueForKey:@"data"];
        
        NSArray *storyArr = [dataDic valueForKey:@"dailystory"];
        
        //NSLog(@"mmmmmmmmm%@",storyArr);
        
        self.storyCategoryArr = [NSMutableArray array];
        self.storyListArr = [NSMutableArray array];
        
        for (NSDictionary *dic in storyArr) {
            
            StoryCategoryModel *model = [StoryCategoryModel new];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [_storyCategoryArr addObject:model];
      
        }
        //回归主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block();
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

//书的简介(最后一页)
- (void)getLastPageModelDataWithUrl:(NSString *)url Block:(myBlock)block
{
    [self.commentArr removeAllObjects];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = responseObject;
        
        NSDictionary *dataDic = [dic valueForKey:@"data"];
        
        lastPageModel *model = [lastPageModel new];
        
        [model setValuesForKeysWithDictionary:dataDic];
        
        for (NSDictionary *dic in model.last_comments) {
            
            //NSLog(@"%@",dic);
            
            CommentModel *model = [CommentModel new];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.commentArr addObject:model];
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block(model,self.commentArr);
        });
        

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

//目录
- (void)getChapterDataWithUrl:(NSString *)url Block:(myBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = responseObject;
        
        NSDictionary *dataDic = [dic valueForKey:@"data"];
        
        NSArray *arr = [dataDic valueForKey:@"chapters"];
        
       // NSLog(@"AAAAAAAAAAAAAAA%@",arr);
        
        for (NSDictionary *dic in arr) {
            
            ChapterModel *model = [ChapterModel new];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.chapterArr addObject:model];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block();
        });
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

//数组懒加载
- (NSMutableArray *)carouselArr
{
    if (!_carouselArr) {
        self.carouselArr = [NSMutableArray array];
    }
    return _carouselArr;
}

- (NSMutableArray *)moreArr
{
    if (!_moreArr) {
        
        self.moreArr = [NSMutableArray array];
    }
    
    return _moreArr;
}
- (NSMutableArray *)loveListArr
{
    if (!_loveListArr) {
        
        self.loveListArr = [NSMutableArray array];
    }
    
    return _loveListArr;
}
- (NSMutableArray *)commentArr
{
    if (!_commentArr) {
        
        self.commentArr = [NSMutableArray array];
    }
    return _commentArr;
}

- (NSMutableArray *)chapterArr
{
    if (!_chapterArr) {
        
        self.chapterArr = [NSMutableArray array];
    }
    
    return _chapterArr;
}

@end

