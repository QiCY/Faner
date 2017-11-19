//
//  ReTableViewCell.h
//  Faner
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReFirstView.h"
#import "ReSecondView.h"
typedef enum{
    CELL_TYPE_FIRST       = 1,//推荐第一个cell
    CELL_TYPE_SECOND      = 2,//推荐第二个cell
    CELL_TYPE_THIRD       = 3,//推荐第三个cell
    CELL_TYPE_FORTH       = 4,//推荐第四个cell
} CELL_TYPE;
@interface ReTableViewCell : UITableViewCell
@property(nonatomic,strong)ReFirstView *firstView;
@property(nonatomic,strong)ReSecondView *secondView;
-(void)setData:(id)data type:(CELL_TYPE)type index:(NSInteger)index;
@end
