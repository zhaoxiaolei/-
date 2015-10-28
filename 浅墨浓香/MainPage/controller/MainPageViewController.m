//
//  MainPageViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MainPageViewController.h"
#import "ScrollerCell.h"
#import "BookViewCell.h"
#import "BookListCell.h"
#import "StoryViewCell.h"

#import "ReauestData.h"
#import "BookModel.h"
#import "StoryModel.h"
#import "UIImageView+WebCache.h"
#import "LoveListTableViewController.h"
#import "CategoryViewController.h"
#import "BookListTableViewController.h"
#import "BookCategoryViewController.h"
#import "StoryCategoryViewController.h"
#import "LastPageViewController.h"


#define KmainPage  @"http://i.itangyuan.com/story/plus/recommend.json"

@interface MainPageViewController ()<scrollerCellDelegate,bookViewCellDelegate>

@property (nonatomic,strong)NSMutableArray *bookArr;
@property (nonatomic,strong)NSMutableArray *storyArr;


@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
   // [self.tableView setBackgroundView:backImage];
    
//    self.tableView.userInteractionEnabled = NO;
    
    //请求数据
    
    [[ReauestData shareRequestData] getDataWithUrl:KmainPage Block:^{
        [self.tableView reloadData];
    }];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"ScrollerCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BookViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cc"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BookListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"dd"];
    [self.tableView registerNib:[UINib nibWithNibName:@"StoryViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ee"];
    
    self.bookArr = [NSMutableArray array];
    self.storyArr = [NSMutableArray array];
}
//请求数据

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
        ScrollerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.Arr = [ReauestData shareRequestData].carouselArr;
        
        if ([ReauestData shareRequestData].carouselIds.count != 0) {
            
            cell.strIdArr = [ReauestData shareRequestData].carouselIds;
        }
        cell.delegate = self;
        
        return cell;
    }else if(indexPath.row == 1){
        
        BookViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
        cell.itemLabel.text = @"💡推荐书单";
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
        cell.delegate = self;
        return cell;
        
    }else if(indexPath.row == 2){
        //获取数据
        if ([ReauestData shareRequestData].bookArr.count != 0) {
            [self.bookArr setArray:[ReauestData shareRequestData].bookArr];
        }
        
        //设置轻拍手势
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] init];
        //添加轻拍事件  跳转到列表界面
        [tap1 addTarget:self action:@selector(firstPushToList:)];

        //设置轻拍手势
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] init];
        //添加轻拍事件  跳转到列表界面
        [tap2 addTarget:self action:@selector(firstPushToList:)];
        //设置轻拍手势
        UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] init];
        //添加轻拍事件  跳转到列表界面
        [tap3 addTarget:self action:@selector(firstPushToList:)];
        
        BookListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dd" forIndexPath:indexPath];
        if (self.bookArr.count != 0) {
            
            cell.selectionStyle =UITableViewCellSelectionStyleNone;
            BookModel *model = self.bookArr[0];
            
            [cell.picOne sd_setImageWithURL:[NSURL URLWithString:model.cover_url] placeholderImage:[UIImage imageNamed:@"back.png"]];
            cell.titleOne.text = model.title;
            
            //第一个图片添加手势
            [cell.picOne addGestureRecognizer:tap1];
            cell.picOne.userInteractionEnabled = YES;
            
            BookModel *model2 = self.bookArr[1];
            [cell.picTwo sd_setImageWithURL:[NSURL URLWithString:model2.cover_url] placeholderImage:[UIImage imageNamed:@"back.png"]];
            cell.titleTwo.text = model2.title;
            //第二个图片添加手势
            [cell.picTwo addGestureRecognizer:tap2];
            cell.picTwo.userInteractionEnabled = YES;
            
            BookModel *model3 = self.bookArr[2];
            [cell.picThree sd_setImageWithURL:[NSURL URLWithString:model3.cover_url] placeholderImage:[UIImage imageNamed:@"back.png"]];
            cell.titleThree.text = model3.title;
            //第三个图片添加手势
            [cell.picThree addGestureRecognizer:tap3];
            cell.picThree.userInteractionEnabled = YES;
            
            cell.picOne.tag = 101;
            cell.picTwo.tag = 102;
            cell.picThree.tag = 103;
            
        }
        return cell;
        
    }else if(indexPath.row == 3){
        BookViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
        cell.itemLabel.text = @"💡每日好故事";
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
        cell.delegate = self;
        return cell;
    }else
    {
        StoryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ee" forIndexPath:indexPath];
         //获取数据
        if (self.storyArr.count == 0) {
            if ([ReauestData shareRequestData].storyArr) {
                [self.storyArr setArray:[ReauestData shareRequestData].storyArr];
                StoryModel *model = self.storyArr[indexPath.row - 4];
                [cell.picImg sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];
                cell.titleLabel.text = model.title;
                cell.contextLabel.text = model.recommend_text;
            }
        }else
        {
            StoryModel *model = self.storyArr[indexPath.row - 4];
            [cell.picImg sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];
            cell.titleLabel.text = model.title;
            cell.contextLabel.text = model.recommend_text;
        }

        return cell;
    }
}
//跳转(同下面cell跳转一样)
- (void)pushwithStr:(NSString *)str
{
    if ([str isEqualToString:@"💡推荐书单"]) {
        
        //跳转到推荐书单分类界面
        BookCategoryViewController *bookCategoryVC = [[BookCategoryViewController alloc] init];
        [self.navigationController pushViewController:bookCategoryVC animated:YES];
    }else if ([str isEqualToString:@"💡每日好故事"]){
    
        //跳转到每日好故事总列表界面
        StoryCategoryViewController *storyCategoryVC = [[StoryCategoryViewController alloc] init];
        [self.navigationController pushViewController:storyCategoryVC animated:YES];
    }
}

//跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 1){
        
        //跳转到推荐书单分类界面
        BookCategoryViewController *bookCategoryVC = [[BookCategoryViewController alloc] init];
        [self.navigationController pushViewController:bookCategoryVC animated:YES];
        
    }else if(indexPath.row == 3){
        
        //跳转到每日好故事总列表界面
        StoryCategoryViewController *storyCategoryVC = [[StoryCategoryViewController alloc] init];
        [self.navigationController pushViewController:storyCategoryVC animated:YES];
        
    }
    
    if (indexPath.row > 3 ) {
        
        LastPageViewController *lastVC = [[LastPageViewController alloc] init];
        
        StoryModel *model = self.storyArr[indexPath.row - 4];
        
        //NSLog(@"DDDDDDDDDD%@",model.ID);
        
        lastVC.strID = model.ID;
        
        [self.navigationController pushViewController:lastVC animated:YES];
    }

}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 190;
    }else if(indexPath.row == 1){
        return 40;
    }else if(indexPath.row == 2){
        return 173;
    }else if(indexPath.row == 3){
        return 40;
    }else
    {
        return 114;
    }
}

//纯爱,时光,惊悚跳转到列表
- (void)pushWithStrID:(NSString *)strID
{
    LoveListTableViewController *loveVC = [[LoveListTableViewController alloc] init];
    
    loveVC.id = strID;
   
    [self.navigationController pushViewController:loveVC animated:YES];
    
}
//全部分类跳转到列表
- (void)push
{
    CategoryViewController *categoryVC = [[CategoryViewController alloc] init];
    [self.navigationController showViewController:categoryVC sender:nil];
}

//推荐书单跳转
-(void)firstPushToList:(UITapGestureRecognizer *)tap
{
    BookListTableViewController *bookListVC = [[BookListTableViewController alloc] init];
    NSInteger num = tap.view.tag;
    bookListVC.model = _bookArr[num - 101];
    
    [self.navigationController pushViewController:bookListVC animated:YES];
}
//轮播图跳转
- (void)pushToLastPage:(NSString *)strID
{
    LastPageViewController *lastVC = [[LastPageViewController alloc] init];
    
   // NSLog(@"DDDDDDDDDDDDD%@",strID);
    
    lastVC.strID = strID;
    
    [self.navigationController pushViewController:lastVC animated:YES];
}

@end
