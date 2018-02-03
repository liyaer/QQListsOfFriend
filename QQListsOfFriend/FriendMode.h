//
//  FriendMode.h
//  QQListsOfFriend
//
//  Created by 杜文亮 on 2018/2/2.
//  Copyright © 2018年 杜文亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendMode : NSObject

@property (nonatomic,assign) BOOL isShow;
@property (nonatomic,strong) NSString *listName;
@property (nonatomic,strong) NSArray *friends;


-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)friendWithDic:(NSDictionary *)dic;

@end
