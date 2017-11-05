//
//  ReSecondView.h
//  Faner
//
//  Created by apple on 2017/11/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReSecondView : UIView
@property(nonatomic,strong)UILabel *themeLab;
@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,strong)UILabel *typeLab;
@property(nonatomic,strong)UIButton *actionBtn;
@property(nonatomic,strong)UIImageView *arrowImg;
@property(nonatomic,strong)UIScrollView *scrollView;
-(void)refreshWithData:(id)data itemSize:(CGSize)size;
@end
