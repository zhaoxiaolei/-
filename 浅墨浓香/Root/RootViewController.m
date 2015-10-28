//
//  RootViewController.m
//  浅墨浓香
//
//  Created by lanou3g on 15/10/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RootViewController.h"
#import "MainPageViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //布局tabbar
    [self layoutScreen];
    
}
//布局tabbar
- (void)layoutScreen
{
    MainPageViewController *mainVC = [[MainPageViewController alloc] init];
    mainVC.title = @"浅墨浓香";
    UINavigationController *mainNavc = [[UINavigationController alloc] initWithRootViewController:mainVC];
    mainNavc.title = @"首页";
//    mainNavc.tabBarItem.image = [UIImage imageNamed:@"bar.png"];
    self.viewControllers = @[mainNavc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
