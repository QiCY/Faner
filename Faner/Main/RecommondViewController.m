//
//  RecommondViewController.m
//  Faner
//
//  Created by apple on 2017/11/4.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "RecommondViewController.h"
#import <TCRotatorImageView.h>
#import "ReFirstView.h"
#import "ReSecondView.h"

@interface RecommondViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataList;
@end

@implementation RecommondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataList = [[NSMutableArray alloc] init];
    [self createTableView];
    
}
-(void)createTableView
{
    NSArray *imgList = @[@"img_home_brands",@"img_home_brands",@"img_home_brands",@"img_home_brands"];
    NSDictionary *dic = @{@"theme":@"明星大图集",@"type":@"STARS",@"cate":@"全部品牌",@"imgs":imgList};
    
    
    NSArray *imgList1 = @[@"img_home_brands",@"img_home_brands",@"img_home_brands",@"img_home_brands"];
    NSDictionary *dic1 = @{@"theme":@"商家新品",@"type":@"BRANDS",@"cate":@"全部新品",@"imgs":imgList1};
    
    
    
//    ReSecondView *firstView = [[ReSecondView alloc] initWithFrame:CGRectMake(0, 110, WIDTH, 410)];
//    [self.view addSubview:firstView];
    
    
//    [firstView refreshWithData:dic itemSize:CGSizeMake(240, 400)];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - NAVHEIGHT -44 -TABHEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellid = @"cellid";
    ReTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[ReTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    CLog(@"the cell height %f",cell.frame.size.height);
    if (indexPath.row == 0) {
        [cell setData:nil type:CELL_TYPE_FIRST index:indexPath.row];
    }else{
        [cell setData:nil type:CELL_TYPE_SECOND index:indexPath.row];
    }
    
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 430;
    }
    else{
        return 400;
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
