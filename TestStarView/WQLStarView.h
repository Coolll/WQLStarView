//
//  WQLStarView.h
//  TestStarView
//
//  Created by WQL on 16/1/14.
//  Copyright © 2016年 WQL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,StarAliment) {
    StarAlimentDefault,
    StarAlimentCenter,
    StarAlimentRight
};


@interface WQLStarView : UIView
/**
 *  评分
 */
@property (nonatomic,assign) CGFloat commentPoint;
/**
 *  对齐方式
 */
@property (nonatomic,assign) StarAliment starAliment;

/**
 *  初始化方法
 *
 *  @param frame      整个星星视图的frame
 *  @param totalStar  总的星星的个数
 *  @param totalPoint 星星表示的总分数
 *  @param space      星星之间的间距
 *
 *  @return WQLStarView
 */
- (instancetype)initWithFrame:(CGRect)frame withTotalStar:(NSInteger)totalStar withTotalPoint:(CGFloat)totalPoint starSpace:(NSInteger)space;


@end
