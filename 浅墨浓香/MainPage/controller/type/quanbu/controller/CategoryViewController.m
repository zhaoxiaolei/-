//
//  CategoryViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryViewCell.h"
#import "CategoryModel.h"
#import "ReauestData.h"
#import "LoveListTableViewController.h"
#import "MoreCategoryViewController.h"

#define KCateGoryUrl @"http://i.itangyuan.com/recommend/tag/official.json"
@interface CategoryViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation CategoryViewController

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
    
    [self layoutCollectionView];
    
    [self requestData];
}
- (void)requestData
{
    [[ReauestData shareRequestData] getCategoryDataWithUrl:KCateGoryUrl Block:^{
        
        [self.collectionView reloadData];
        
    }];
}
- (void)layoutCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    [self.view addSubview:_collectionView];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册cell
    [_collectionView registerNib:[UINib nibWithNibName:@"CategoryViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [ReauestData shareRequestData].categoryArr.count + 1;
}

//设置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.row == [ReauestData shareRequestData].categoryArr.count) {
    
        cell.categoryLabel.text = @"更多分类";
        cell.countLabel.text = @"";
    }else{
    
        CategoryModel *model = [ReauestData shareRequestData].categoryArr[indexPath.row];
        
        cell.model = model;
        
    }
    cell.uiVIew.layer.borderWidth = 0.5;
    cell.uiVIew.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    return cell;
}

//设置Item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/3, self.view.frame.size.width/3);
}
//设置左右间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
//设置上下边距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
//设置边缘
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 55, 0);
}

//点击cell 跳转列表
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [ReauestData shareRequestData].categoryArr.count ) {
        
        MoreCategoryViewController *moreVC = [[MoreCategoryViewController alloc] init];
        
        [self.navigationController pushViewController:moreVC animated:YES];
    }else{
    CategoryModel *model = [ReauestData shareRequestData].categoryArr[indexPath.row];
    
    LoveListTableViewController *loveVC = [[LoveListTableViewController alloc] init];
    
    loveVC.id = model.StrId;
    
    NSLog(@"%@",loveVC.id);
    
    [self.navigationController pushViewController:loveVC animated:YES];
    }
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
