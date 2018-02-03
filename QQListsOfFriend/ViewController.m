//
//  ViewController.m
//  QQListsOfFriend
//
//  Created by 杜文亮 on 2018/2/2.
//  Copyright © 2018年 杜文亮. All rights reserved.
//

#import "ViewController.h"
#import "SecHeader.h"
#import "FriendMode.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *data_m;

@end


@implementation ViewController

#pragma mark - 懒加载

-(NSMutableArray *)data_m
{
    return _data_m ? : (_data_m = [NSMutableArray arrayWithCapacity:5]);
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor orangeColor];
        
        [_tableView registerNib:[UINib nibWithNibName:@"SecHeader" bundle:[NSBundle mainBundle]] forHeaderFooterViewReuseIdentifier:@"h"];
    }
    return _tableView;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *dataArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DataList" ofType:@"plist"]];
    for (NSDictionary *dic in dataArr)
    {
        [self.data_m addObject:[FriendMode friendWithDic:dic]];
    }
    NSLog(@"%@\n%@",dataArr,self.data_m);
    [self.view addSubview:self.tableView];
}




#pragma mark - tableView dateSource and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data_m.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data_m[section] isShow] ? [self.data_m[section] friends].count : 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"s"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"s"];
    }
    cell.textLabel.text = [self.data_m[indexPath.section] friends][indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SecHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"h"];
    if (!header)
    {
        header = [[SecHeader alloc] initWithReuseIdentifier:@"h"];
    }
    header.title = [self.data_m[section] listName];
    header.show = [self.data_m[section] isShow];
    header.showOrHide = ^
    {
        FriendMode *mode = self.data_m[section];
        mode.isShow = !mode.isShow;
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    };
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}


@end
