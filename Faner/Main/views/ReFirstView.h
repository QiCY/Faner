//
//  ReFirstView.h
//  Faner
//
//  Created by apple on 2017/11/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TCRotatorImageView.h>
@interface ReFirstView : UIView<TCRotatorImageViewDelegate>
@property(nonatomic,strong)TCRotatorImageView *scrollView;
@property(nonatomic,strong)UIView *cateView;
@property(nonatomic,strong)NSArray *cateList;
@property(nonatomic,strong)NSArray *bannerList;
-(id)initWithFrame:(CGRect)frame;
-(void)setBannerList:(NSArray *)bannerList cateList:(NSArray *)cateList;
@end
