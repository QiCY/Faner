//
//  ReSecondView.m
//  Faner
//
//  Created by apple on 2017/11/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ReSecondView.h"

@implementation ReSecondView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor redColor];
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
        [self addSubview:headView];
        
        self.themeLab = [[UILabel alloc] init];
        self.themeLab.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
        self.themeLab.textColor = [Utils getColorWithString:@"333333"];
        [headView addSubview:self.themeLab];
        
        self.lineLab = [[UILabel alloc] init];
        [headView addSubview:self.lineLab];
        
        self.typeLab = [[UILabel alloc] init];
        self.typeLab.font = [UIFont fontWithName:@"STHeitiJ-Light" size:12];
        self.typeLab.textColor = [Utils getColorWithString:@"818181"];
        
        [headView addSubview:self.typeLab];
        
        self.actionBtn = [[UIButton alloc] init];
        [self.actionBtn setTitleColor:[Utils getColorWithString:@"333333"] forState:UIControlStateNormal];
        [headView addSubview:self.actionBtn];
        
        self.arrowImg = [[UIImageView alloc] init];
        [headView addSubview:self.arrowImg];
        
        self.scrollView = [[UIScrollView alloc] init];
        [self addSubview:self.scrollView];
    }
    return self;
}
-(void)refreshWithData:(id)data itemSize:(CGSize)size{
    
    self.themeLab.text = data[@"theme"];
    CGSize themeSize = [Utils getLabelSizeWithFont:self.themeLab.font string:self.themeLab.text];
    self.themeLab.frame = CGRectMake(20, 30, themeSize.width, 30);
    
    self.lineLab.frame = CGRectMake(CGRectGetMaxX(self.themeLab.frame)+8, 32, 0.2, self.themeLab.frame.size.height-4);
    self.lineLab.backgroundColor = [UIColor grayColor];
    
    self.typeLab.text = data[@"type"];
    CGSize typeSize = [Utils getLabelSizeWithFont:self.typeLab.font string:self.typeLab.text];
    self.typeLab.frame = CGRectMake(CGRectGetMaxX(self.lineLab.frame)+8, 30, typeSize.width, 30);
    
    self.arrowImg.frame = CGRectMake(WIDTH - 15-10, 38, 5, 14);
    self.arrowImg.image = [UIImage imageNamed:@"ic_home_arrow_more"];
    [self.actionBtn setTitle:data[@"cate"] forState:UIControlStateNormal];
    self.actionBtn.frame = CGRectMake(WIDTH - 15-6-10-80, 30, 80, 30);
    NSArray* imgList = data[@"imgs"];
    for (int i = 0; i<imgList.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*(size.width+10), 0, size.width, size.height)];
        [self.scrollView addSubview:button];
        [button setBackgroundImage:[UIImage imageNamed:imgList[i]] forState:UIControlStateNormal];
    }
    
    self.scrollView.contentSize = CGSizeMake(20+imgList.count*(size.width+10), size.width+10);
//    self.scrollView.pagingEnabled = YES;
    self.scrollView.frame = CGRectMake(20, 100, WIDTH-20, size.width+10);
}
@end
