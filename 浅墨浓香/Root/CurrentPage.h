//
//  CurrentPage.h
//  浅墨浓香
//
//  Created by lanou3g on 15/10/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentPage : NSObject
@property (nonatomic,assign) NSInteger currentCount;

+(CurrentPage *)sharePage;

@end
