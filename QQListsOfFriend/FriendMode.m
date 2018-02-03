//
//  FriendMode.m
//  QQListsOfFriend
//
//  Created by 杜文亮 on 2018/2/2.
//  Copyright © 2018年 杜文亮. All rights reserved.
//

#import "FriendMode.h"

@implementation FriendMode

-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)friendWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

@end
