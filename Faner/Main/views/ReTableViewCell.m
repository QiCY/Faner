//
//  ReTableViewCell.m
//  Faner
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ReTableViewCell.h"

@implementation ReTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.firstView = [[ReFirstView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 430)];
        [self.contentView addSubview:self.firstView];
        
        self.secondView = [[ReSecondView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 240)];
        [self.contentView addSubview:self.secondView];
        
    }
    return self;
}

-(void)setData:(id)data type:(CELL_TYPE)type index:(NSInteger)index{
    switch (type) {
        case CELL_TYPE_FIRST:
        {
            NSArray *banners = @[@"img_home_advertising",@"img_home_advertising",@"img_home_advertising"];
            NSArray *cates = @[@"img_home_advantage_01",@"img_home_advantage_02",@"img_home_advantage_03",@"img_home_advantage_04"];
            self.secondView.hidden = YES;
            self.firstView.hidden = NO;
            [self.firstView setBannerList:banners cateList:cates];
        }
            break;
        case CELL_TYPE_SECOND:
        {
            self.firstView.hidden = YES;
            self.secondView.hidden = NO;
            NSArray *imgList2 = @[@"img_home_brands",@"img_home_brands",@"img_home_brands",@"img_home_brands"];
            NSDictionary *dic2 = @{@"theme":@"平台玩法",@"type":@"BRANDS",@"cate":@"更多玩法",@"imgs":imgList2};
            CLog(@"the height %f",self.frame.size.height);
            CGFloat h = 140;
            CGFloat w = 240;
            
            if (index%3==1) {
                [self.secondView hiddenActionBtn:YES];
                h = 280;
                 w = 240;
                
            }else if (index%3==0) {
                    h = 200;
                    w = 140;
                    [self.secondView hiddenActionBtn:NO];
            }
            
            [self.secondView refreshWithData:dic2 itemSize:CGSizeMake(w,h)];
//            self.secondView.frame = CGRectMake(0, 0, WIDTH, h+140);
        }
            break;
        case CELL_TYPE_THIRD:
            
            break;
        case CELL_TYPE_FORTH:
            
            break;
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
