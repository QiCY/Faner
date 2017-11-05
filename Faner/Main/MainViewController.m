//
//  MainViewController.m
//  Faner
//
//  Created by apple on 2017/11/4.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "MainViewController.h"
#import <SPPageMenu.h>
#import "RecommondViewController.h"
#import "LookViewController.h"
#import "BrandViewController.h"
#import "ThemeViewController.h"

#define subVCH   HEIGHT-NAVHEIGHT-TABHEIGHT-44
@interface MainViewController ()<SPPageMenuDelegate>


@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)SPPageMenu *pageMenu;
@property(nonatomic,strong)NSArray *dataArr;
@property (nonatomic, strong) NSMutableArray *myChildViewControllers;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"首页"];
    [self setNavContent];
    [self createMainView];
    
    
}
-(void)setNavContent{
    UIButton *messageBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 17)];
    [messageBtn setImage:[UIImage imageNamed:@"ic_home_nav_message"] forState:UIControlStateNormal];
    messageBtn.tag = 1;
    [messageBtn addTarget:self action:@selector(messageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self setNavLeftView:messageBtn];
    
    UIButton *searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 17)];
    [searchBtn setImage:[UIImage imageNamed:@"ic_home_nav_finder"] forState:UIControlStateNormal];
    searchBtn.tag = 2;
    [searchBtn addTarget:self action:@selector(messageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self setNavRightView:searchBtn];
    
    UIImageView *titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 23.5)];
    titleImg.image = [UIImage imageNamed:@"img_home_nav_logo"];
    [self setNavTitleView:titleImg];
    
}
//导航条按钮事件
-(void)messageBtnClick:(UIButton *)sender{
    CLog(@"%d",sender.tag);
    if (sender.tag == 1) {
//        消息按钮
        
    }else if (sender.tag == 2){
//        搜索按钮
    }
}
-(void)createMainView{
    self.dataArr = @[@"推荐",@"LOOK",@"品牌",@"专题"];
    
    // trackerStyle:跟踪器的样式
    SPPageMenu *pageMenu = [SPPageMenu pageMenuWithFrame:CGRectMake(0, 64, WIDTH, 44) trackerStyle:SPPageMenuTrackerStyleLine];
    // 传递数组，默认选中第1个
//    [pageMenu setItemTitleFont:[UIFont fontWithName:@"STHeitiJ-Medium" size:13]];
    [pageMenu setSelectedItemTitleColor:[Utils getColorWithString:@"20bbc6"]];
    pageMenu.tracker.backgroundColor = [Utils getColorWithString:@"20bbc6"];
    [pageMenu setUnSelectedItemTitleColor:[Utils getColorWithString:@"818181"]];
    [pageMenu setItems:self.dataArr selectedItemIndex:0];
    // 可滑动的自适应内容排列
    pageMenu.permutationWay = SPPageMenuPermutationWayNotScrollEqualWidths;
    // 设置代理
    pageMenu.delegate = self;
    [self.view addSubview:pageMenu];
    _pageMenu = pageMenu;
    
    
    
    NSArray *subVCList = @[[RecommondViewController new],[LookViewController new],[BrandViewController new],[ThemeViewController new]];
    for (int i = 0; i < self.dataArr.count; i++) {
        if (subVCList.count > i) {
            BaseViewController *baseVC = subVCList[i];
//            NSString *text = [self.pageMenu titleForItemAtIndex:i];
//            if (text) {
//                baseVc.text = text;
//            } else {
//                baseVc.text = @"图片";
//            }
            [self addChildViewController:baseVC];
            // 控制器本来自带childViewControllers,但是遗憾的是该数组的元素顺序永远无法改变，只要是addChildViewController,都是添加到最后一个，而控制器不像数组那样，可以插入或删除任意位置，所以这里自己定义可变数组，以便插入(删除)(如果没有插入(删除)功能，直接用自带的childViewControllers即可)
            [self.myChildViewControllers addObject:baseVC];
        }
    }
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NAVHEIGHT+44, WIDTH, subVCH)];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    self.pageMenu.bridgeScrollView = self.scrollView;
    
    // pageMenu.selectedItemIndex就是选中的item下标
    if (self.pageMenu.selectedItemIndex < self.myChildViewControllers.count) {
        BaseViewController *baseVc = self.myChildViewControllers[self.pageMenu.selectedItemIndex];
        [scrollView addSubview:baseVc.view];
        baseVc.view.frame = CGRectMake(WIDTH*self.pageMenu.selectedItemIndex, 0, WIDTH, subVCH);
        scrollView.contentOffset = CGPointMake(WIDTH*self.pageMenu.selectedItemIndex, 0);
        scrollView.contentSize = CGSizeMake(self.dataArr.count*WIDTH, 0);
    }
    
//    for (int i = 0; i<subVCList.count; i++) {
//        BaseViewController *baseVC = subVCList[i];
//        baseVC.view.frame = CGRectMake(WIDTH*i, 0, WIDTH, subVCH);
//        [scrollView addSubview:baseVC.view];
//    }
//    scrollView.contentSize = CGSizeMake(self.dataArr.count*WIDTH, subVCH);
    
    
   
}
- (NSMutableArray *)myChildViewControllers {
    
    if (!_myChildViewControllers) {
        _myChildViewControllers = [NSMutableArray array];
        
    }
    return _myChildViewControllers;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark SPPageMenuDelegate
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedAtIndex:(NSInteger)index {
    NSLog(@"%zd",index);
}

- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    
    NSLog(@"%zd------->%zd",fromIndex,toIndex);
    // 如果fromIndex与toIndex之差大于等于2,说明跨界面移动了,此时不动画.
    if (labs(toIndex - fromIndex) >= 2) {
        [self.scrollView setContentOffset:CGPointMake(WIDTH * toIndex, 0) animated:NO];
    } else {
        [self.scrollView setContentOffset:CGPointMake(WIDTH * toIndex, 0) animated:YES];
    }
    if (self.myChildViewControllers.count <= toIndex) {return;}
    
    UIViewController *targetViewController = self.myChildViewControllers[toIndex];
    // 如果已经加载过，就不再加载
    if ([targetViewController isViewLoaded]) return;
    
    targetViewController.view.frame = CGRectMake(WIDTH * toIndex, 0, WIDTH, subVCH);
    [_scrollView addSubview:targetViewController.view];
    
}

@end
