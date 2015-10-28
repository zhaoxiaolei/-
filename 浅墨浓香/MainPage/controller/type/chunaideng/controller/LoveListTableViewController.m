//
//  LoveListTableViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoveListTableViewController.h"
#import "LoveListModel.h"
#import "LoveListViewCell.h"
#import "ReauestData.h"
#import "MJRefresh.h"
#import "MBProgressHUD.h"
#import "LastPageViewController.h"


#define KListUrl @"http://i.itangyuan.com/book/tag/rank/"
#define backStr @"/choice.json?count=20&offset="

@interface LoveListTableViewController ()

@property (nonatomic,assign) NSInteger refreshCount;

@property (nonatomic,strong) NSMutableArray *loveListArr;

//@property (nonatomic,strong)MBProgressHUD *hud;
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation LoveListTableViewController

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

    self.refreshCount = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LoveListViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    //加载
    [self reloadProgressHud];
    
    //请求数据
    [self requestData];
    
    //刷新数据
    [self refreshData];
    
    
}
//加载
- (void)reloadProgressHud
{
   self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageView.image = [UIImage imageNamed:@"reload.jpg"];
    
    [self.view addSubview:_imageView];
}
//请求数据
- (void)requestData
{
    [[ReauestData shareRequestData] getLoveListDataWithUrl:[NSString stringWithFormat:@"%@%@%@%@",KListUrl,self.id,backStr,@"0"] Block:^(NSMutableArray *array){
        NSLog(@"%@",[NSString stringWithFormat:@"%@%@%@%@",KListUrl,self.id,backStr,@"0"]);
        
        [self.loveListArr setArray:array];
        [self.tableView reloadData];
        
        [self.imageView removeFromSuperview];
    }];
}
- (NSMutableArray *)loveListArr
{
    if (!_loveListArr) {
        
        self.loveListArr = [NSMutableArray array];
    }
    
    return _loveListArr;
}
//刷新数据
- (void)refreshData
{
    //头刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefreshing)];
    
    //尾刷新
    [self.tableView addFooterWithTarget:self action:@selector(footerRefreshing)];
}
//头刷新
- (void)headerRefreshing
{
    [self requestData];
        
    [self.tableView headerEndRefreshing];
   
}
//尾刷新
- (void)footerRefreshing
{
    self.refreshCount = self.refreshCount + 20;
    
    [[ReauestData shareRequestData] getLoveListDataWithUrl:[NSString stringWithFormat:@"%@%@%@%ld",KListUrl,self.id,backStr,_refreshCount] Block:^(NSMutableArray *array){
        
        for (LoveListModel *model in array) {
            
            [self.loveListArr addObject:model];
        }
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
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

    return self.loveListArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LoveListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    LoveListModel *model = _loveListArr[indexPath.row];
    
    cell.loveModel = model;
    
    return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LoveListModel *model = [ReauestData shareRequestData].loveListArr[indexPath.row];
    
    LastPageViewController *lastVC = [[LastPageViewController alloc] init];
    
    lastVC.strID = model.id;
    
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
