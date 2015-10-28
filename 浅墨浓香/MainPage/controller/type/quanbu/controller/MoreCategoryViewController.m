//
//  MoreCategoryViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MoreCategoryViewController.h"
#import "ReauestData.h"
#import "MoreCategoryModel.h"
#import "LoveListTableViewController.h"

#define KMoreUrl @"http://i.itangyuan.com/recommend/tag/more.json"
@interface MoreCategoryViewController ()

@end

@implementation MoreCategoryViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //读取数据
    [self requestData];
}
//读取数据
- (void)requestData
{
    [[ReauestData shareRequestData] getMoreCategoryDataWithUrl:KMoreUrl Block:^{
        
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [ReauestData shareRequestData].moreArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    static NSString *aa = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:aa];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:aa];
    }
    
    MoreCategoryModel *model = [ReauestData shareRequestData].moreArr[indexPath.row];
    
    cell.textLabel.text = model.tag;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@本",model.count];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LoveListTableViewController *loveVC = [[LoveListTableViewController alloc] init];
    
    MoreCategoryModel *model = [ReauestData shareRequestData].moreArr[indexPath.row];
    
    NSLog(@"%@",model.strID);
    loveVC.id = model.strID;
    
    [self.navigationController pushViewController:loveVC animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
