//
//  ReFirstView.m
//  Faner
//
//  Created by apple on 2017/11/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ReFirstView.h"

@implementation ReFirstView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.scrollView = [TCRotatorImageView rotatorImageViewWithFrame:CGRectMake(0, 0, WIDTH, 230) imageNameArray:@[@"img_home_advertising",@"img_home_advertising",@"img_home_advertising"]];
//        self.scrollView = [TCRotatorImageView rotatorImageViewWithFrame:CGRectMake(0, 0, WIDTH, 230) imageURLStrigArray:@[@"",@"",@""] placeholerImage:[UIImage imageNamed:@""]];
        self.scrollView.delegate = self;
        self.scrollView.rotateTimeInterval = 2;
        [self addSubview:self.scrollView];
        
        self.cateView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrollView.frame), WIDTH, 180)];
        CGFloat width = WIDTH/2;
        NSArray *imageList = @[@"img_home_advantage_01",@"img_home_advantage_02",@"img_home_advantage_03",@"img_home_advantage_04"];
        for (int i = 0; i<2; i++) {
            for (int j=0; j<2; j++) {
                UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width, j*90, width-0.5, 90-0.5)];
                button.layer.borderWidth = 0.5;
                button.layer.borderColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1].CGColor;
                button.tag = 2*j+i;
                [button setBackgroundImage:[UIImage imageNamed:imageList[2*j+i]] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(cateBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self.cateView addSubview:button];
            }
        }
        [self addSubview:self.cateView];
        
    }
    return self;
}
-(void)cateBtnClicked:(UIButton *)sender{
    CLog(@"send.tag is %ld",sender.tag);
}
-(void)rotatorImageView:(TCRotatorImageView *)rotatorImageView didClickImageIndex:(NSInteger)index
{
    
}
@end
