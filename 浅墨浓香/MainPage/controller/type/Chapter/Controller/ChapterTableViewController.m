//
//  ChapterTableViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/26.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ChapterTableViewController.h"
#import "ReauestData.h"
#import "ChapterModel.h"
#import "ChapterTableViewCell.h"
#import "UIImageView+WebCache.h"

#define KChapterUrl @"http://i.itangyuan.com/book/sync/"
#define Url @"/0.json"
@interface ChapterTableViewController ()

@property (nonatomic,assign) NSInteger count;
@property (nonatomic,strong) NSArray *orderArray;

@end

@implementation ChapterTableViewController

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
    
    //NSLog(@"KKKKKKKKKKKKKKKKKKK%@",self.lastModel.strID);
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ChapterTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    [self requestData];
}
- (void)requestData
{
    [[ReauestData shareRequestData] getChapterDataWithUrl:[NSString stringWithFormat:@"%@%@%@",KChapterUrl,self.lastModel.strID,Url] Block:^{
        
        
        
        if ([ReauestData shareRequestData].chapterArr.count != 0) {
            
            self.orderArray = [NSArray array];
            _orderArray = [[[ReauestData shareRequestData].chapterArr reverseObjectEnumerator] allObjects];
            }
        
        [self.tableView reloadData];
        
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

//设置区高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    self.count = [ReauestData shareRequestData].chapterArr.count;
    return [ReauestData shareRequestData].chapterArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChapterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (self.orderArray.count != 0) {
        
        ChapterModel *model = self.orderArray[indexPath.row];
     
        cell.chapterModel = model;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *backVIew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    
    backVIew.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 60)];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.lastModel.cover_url]];
    
    [backVIew addSubview:imageView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 200, 25)];
    
    titleLabel.text = self.lastModel.name;
    
    [backVIew addSubview:titleLabel];
    
    UILabel *authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 45, 200, 25)];
    
    authorLabel.text = [self.lastModel.author_tag valueForKey:@"nickname"];
    
    [authorLabel setFont:[UIFont systemFontOfSize:12]];
    
    [backVIew addSubview:authorLabel];
    
    return backVIew;
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
