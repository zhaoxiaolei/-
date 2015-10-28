//
//  BookCategoryViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "BookCategoryViewController.h"
#import "BookCategoryCell.h"
#import "BookModel.h"
#import "ReauestData.h"
#import "BookListTableViewController.h"
#import "BookCategoryModel.h"
#import "MBProgressHUD.h"

#define KCategoryUrl @"http://i.itangyuan.com/story/plus/booklist/choice.json?count=360&offset=0"
@interface BookCategoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;


@property (nonatomic,strong) NSMutableArray *refreshArr;
@property (nonatomic,assign) NSInteger *refreshCount;
@property (nonatomic,strong) MBProgressHUD *hud;

@end

@implementation BookCategoryViewController

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
    // Do any additional setup after loading the view.
    
    //布局collectionView
    [self layoutCollectionView];
    
    //加载
    [self reloadProgress];
    
    //请求数据
    [self requstData];
    
    //刷新数据
    [self refreshData];
}
//加载
- (void)reloadProgress
{
    self.hud = [[MBProgressHUD alloc] initWithView:self.view];
    _hud.frame = self.view.bounds;
    _hud.minSize = CGSizeMake(100, 100);
    _hud.mode = MBProgressHUDModeIndeterminate;
    
    [self.view addSubview:_hud];
    
    [_hud show:YES];}
//请求数据
- (void)requstData
{
    //读取数据
    [[ReauestData shareRequestData] getBookCategoryDataWithUrl:KCategoryUrl Block:^{
        
        [self.collectionView reloadData];
        
        [self.hud removeFromSuperview];
    }];
}
//刷新数据
- (void)refreshData
{
    
}


//布局collectionView
- (void)layoutCollectionView
{
    //布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //注册cell
    //注册cell
    [_collectionView registerNib:[UINib nibWithNibName:@"BookCategoryCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - delegateAndData
//分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//Item数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [ReauestData shareRequestData].bookCategoryArr.count;
}
//设置cell

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    BookCategoryModel *model = [ReauestData shareRequestData].bookCategoryArr[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

//设置cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/2-20, self.view.frame.size.height/3);
}
//设置边缘
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 55, 10);
}
//点击cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BookCategoryModel *model = [ReauestData shareRequestData].bookCategoryArr[indexPath.row];
    
    BookListTableViewController *bookListVC = [[BookListTableViewController alloc] init];
    bookListVC.model = model;
   
    [self.navigationController pushViewController:bookListVC animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
