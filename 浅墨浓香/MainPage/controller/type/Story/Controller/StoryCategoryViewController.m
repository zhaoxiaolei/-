//
//  StoryCategoryViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "StoryCategoryViewController.h"
#import "StoryCategoryCell.h"
#import "StoryCategoryModel.h"
#import "ReauestData.h"
#import "StoryListModel.h"
#import "LastPageViewController.h"

#define KStoryListUrl @"http://i.itangyuan.com/story/plus/dailystory.json?count=20&offset=0"
@interface StoryCategoryViewController ()

@end

@implementation StoryCategoryViewController

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
    [self.tableView registerNib:[UINib nibWithNibName:@"StoryCategoryCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //请求数据
    [[ReauestData shareRequestData] getStoryCategoryDataWithUrl:KStoryListUrl Block:^{
        
        [self.tableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

//分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [ReauestData shareRequestData].storyCategoryArr.count;
}
//设置区头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    StoryCategoryModel *model = [ReauestData shareRequestData].storyCategoryArr[section];
   
    NSString *str = @"10OCT.";
    
    return [NSString stringWithFormat:@"%@  %@",str,model.date_str];
    
}
//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
//设置每个分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    StoryCategoryModel *model = [ReauestData shareRequestData].storyCategoryArr[section];
    
    return model.item_list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StoryCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
    StoryCategoryModel *model = [ReauestData shareRequestData].storyCategoryArr[indexPath.section];
    
    NSArray *listArr = model.item_list;
    
    StoryListModel *listModel = [StoryListModel new];
    [listModel setValuesForKeysWithDictionary:listArr[indexPath.row]];
    
    cell.model = listModel;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryCategoryModel *model = [ReauestData shareRequestData].storyCategoryArr[indexPath.section];
    
    NSArray *listArr = model.item_list;
    
    StoryListModel *listModel = [StoryListModel new];
    [listModel setValuesForKeysWithDictionary:listArr[indexPath.row]];
    
    LastPageViewController *lastVC = [[LastPageViewController alloc] init];
    
    NSLog(@"DDDDDDDDDD%@",listModel.strID);
    
    lastVC.strID = listModel.strID;
    
    [self.navigationController pushViewController:lastVC animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
