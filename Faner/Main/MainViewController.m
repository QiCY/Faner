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
#define subVCH   HEIGHT-64-44-44
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
    [self createMainView];
}
-(void)createMainView{
    self.dataArr = @[@"推荐",@"LOOK",@"品牌",@"专题"];
    
    // trackerStyle:跟踪器的样式
    SPPageMenu *pageMenu = [SPPageMenu pageMenuWithFrame:CGRectMake(0, 64, WIDTH, 44) trackerStyle:SPPageMenuTrackerStyleLine];
    // 传递数组，默认选中第1个
    [pageMenu setItems:self.dataArr selectedItemIndex:0];
    // 可滑动的自适应内容排列
    pageMenu.permutationWay = SPPageMenuPermutationWayNotScrollEqualWidths;
    // 设置代理
    pageMenu.delegate = self;
    [self.view addSubview:pageMenu];
    _pageMenu = pageMenu;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64+44, WIDTH, subVCH)];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    self.pageMenu.bridgeScrollView = self.scrollView;
    
    NSArray *subVCList = @[[RecommondViewController new],[LookViewController new],[BrandViewController new],[ThemeViewController new]];
    for (int i = 0; i<subVCList.count; i++) {
        BaseViewController *baseVC = subVCList[i];
        baseVC.view.frame = CGRectMake(WIDTH*i, 0, WIDTH, subVCH);
        [scrollView addSubview:baseVC.view];
    }
    scrollView.contentSize = CGSizeMake(self.dataArr.count*WIDTH, subVCH);
    
    
   
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
-(void)pageMenu:(SPPageMenu *)pageMenu buttonClickedAtIndex:(NSInteger)index
{
    
}

@end
