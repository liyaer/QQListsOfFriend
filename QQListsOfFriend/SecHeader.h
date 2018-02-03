//
//  SecHeader.h
//  QQListsOfFriend
//
//  Created by 杜文亮 on 2018/2/2.
//  Copyright © 2018年 杜文亮. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ShowOrHide)(void);

@interface SecHeader : UITableViewHeaderFooterView

@property (nonatomic,copy) ShowOrHide showOrHide;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) BOOL show;

@end
