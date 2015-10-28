//
//  CommentModel.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"author_tag"]) {
        
        self.authorImage = [value valueForKey:@"avatar_url"];
        
        self.nickName = [value valueForKey:@"nickname"];
    
    }
}

@end
