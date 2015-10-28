//
//  LastPageViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LastPageViewController.h"
#import "FIrstCell.h"
#import "SecondCell.h"
#import "ThirdCell.h"
#import "FourthCell.h"
#import "lastPageModel.h"
#import "ReauestData.h"
#import "CommentModel.h"
#import "ChapterTableViewController.h"

#define KLastUrl @"http://i.itangyuan.com/book/info/"
@interface LastPageViewController ()<FirstCellDelegate>

@property (nonatomic,strong) lastPageModel *model;

@property (nonatomic,strong) NSMutableArray *commentArr;

@end

@implementation LastPageViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
        [self requestData];
   // [self.navigationController setNavigationBarHidden:YES];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.commentArr = [NSMutableArray array];
    
//    [self requestData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FIrstCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"first"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SecondCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"second"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ThirdCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"third"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FourthCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"fourth"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
- (void)requestData
{
    [[ReauestData shareRequestData] getLastPageModelDataWithUrl:[NSString stringWithFormat:@"%@%@.json",KLastUrl,self.strID] Block:^(lastPageModel *model){
        
        self.model = model;
        
        [self.tableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }else if(section == 1){
    
        return 5;
    }else{
    
        return 1;
    }
}
//设置区高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 0;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        FIrstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        
        if (self.model != nil) {
            
            cell.model = self.model;
        }
        
        cell.delegate = self;
        return cell;
    }else if (indexPath.section == 1 && indexPath.row == 0){
    
        SecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        if (self.model != nil) {
            
            cell.model = self.model;
        }
        return cell;
    }else if (indexPath.section == 1 && indexPath.row > 0 && indexPath.row < 4){
    
        ThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"third" forIndexPath:indexPath];
        
        NSArray *commentArr = [ReauestData shareRequestData].commentArr;
        if (commentArr.count) {
            CommentModel *model = commentArr[indexPath.row - 1];
            cell.model = model;
        }
        return cell;
        
    }else if (indexPath.section == 2){
    
        FourthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourth" forIndexPath:indexPath];
        
        return cell;
    }else{
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
        return cell;
    }
    
}


- (void)pushToChapterWithModel:(lastPageModel *)model
{
    ChapterTableViewController *chapterVC = [[ChapterTableViewController alloc] init];
    
    if (model != nil) {
        
        chapterVC.lastModel = model;
    }
    
   // NSLog(@"BBBBBBBBBBBBBBB%@",chapterVC.lastModel.strID);
    
    [self.navigationController pushViewController:chapterVC animated:YES];
}


//设置行高
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//}

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
