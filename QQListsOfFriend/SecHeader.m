//
//  SecHeader.m
//  QQListsOfFriend
//
//  Created by 杜文亮 on 2018/2/2.
//  Copyright © 2018年 杜文亮. All rights reserved.
//

#import "SecHeader.h"

@interface SecHeader()

@property (weak, nonatomic) IBOutlet UIImageView *arrowImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end


@implementation SecHeader

-(void)awakeFromNib
{
    [super awakeFromNib];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
    [self.contentView addGestureRecognizer:tap];
    self.contentView.backgroundColor = [UIColor redColor];
}

-(void)clickAction
{
    if (self.showOrHide)
    {
        self.showOrHide();
    }
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLab.text = title;
}

-(void)setShow:(BOOL)show
{
    _show = show;
    self.arrowImg.image = show ? [UIImage imageNamed:@"arrow_bottom"] : [UIImage imageNamed:@"arrow_right"];
}


@end
