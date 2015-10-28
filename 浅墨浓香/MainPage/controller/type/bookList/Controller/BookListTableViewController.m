//
//  BookListTableViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "BookListTableViewController.h"
#import "BookListModel.h"
#import "BookCell.h"
#import "FirstRowCell.h"
#import "ReauestData.h"
#import "MJRefresh.h"
#import "LastPageViewController.h"

#define KBookListUrl @"http://i.itangyuan.com/booklist/"
#define KStr @".json?count=20&offset=0"
@interface BookListTableViewController ()
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation BookListTableViewController

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
    [self.tableView registerNib:[UINib nibWithNibName:@"BookCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstRowCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellcell"];
    
    //加载
    [self reloadProgress];
    
    //请求数据
    [self requstData];
    
}
//加载
- (void)reloadProgress
{
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageView.image = [UIImage imageNamed:@"reload.jpg"];
    
    [self.view addSubview:_imageView];
}
//请求数据
- (void)requstData
{
    //获取数据
    [[ReauestData shareRequestData] getBookListWithUrl:[NSString stringWithFormat:@"%@%@%@",KBookListUrl,self.model.ID,KStr] Block:^{
        
        [self.tableView reloadData];
        
        [self.imageView removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return ([ReauestData shareRequestData].bookListArray.count + 1);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        
        FirstRowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellcell" forIndexPath:indexPath];
        
        cell.model = self.model;
        return cell;
        
    }else{
    
        BookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        BookListModel *bookModel = [ReauestData shareRequestData].bookListArray[indexPath.row-1];
        cell.model = bookModel;
        
        return cell;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 0) {
        
        return 100;
    }
    
    return 150;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LastPageViewController *lastVC = [[LastPageViewController alloc] init];
    if (indexPath.row > 0) {
        
        BookListModel *model = [ReauestData shareRequestData].bookListArray[indexPath.row - 1];
        
        lastVC.strID = model.book_id;
        
        
    }
    
    [self.navigationController pushViewController:lastVC animated:YES];
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
