//
//  WQLStarView.m
//  TestStarView
//
//  Created by WQL on 16/1/14.
//  Copyright © 2016年 WQL. All rights reserved.
//

#import "WQLStarView.h"
@interface WQLStarView()
{
    //星星的高度
    CGFloat starHeight;
    
    //宽度间距
    CGFloat spaceWidth;
    
    //星星总个数
    NSInteger totalNumber;
    
    //单个代表的评分
    CGFloat singlePoint;
    
    //星星的tag
    NSInteger starBaseTag;
    
    //填充的视图
    UIView *starView;
}
@end
@implementation WQLStarView

- (instancetype)initWithFrame:(CGRect)frame withTotalStar:(NSInteger)totalStar withTotalPoint:(CGFloat)totalPoint starSpace:(NSInteger)space
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //对传进来的frame进行处理，取合适的星星的高度
        
        //传进来的高度
        CGFloat height = frame.size.height;
        //减去间距后的平均的宽度（我设置的星星 高度＝宽度）
        CGFloat averageHeight = (frame.size.width-space*(totalStar-1))/totalStar;
        
        if (height>averageHeight) {
            starHeight = averageHeight;
        }else{
            starHeight = height;
        }
        
        starBaseTag = 6666;
        spaceWidth = space;
        totalNumber = totalStar;
        singlePoint = totalPoint/totalStar;
        
        [self loadCustomViewWithTotal:totalStar];
        
    }
    return self;
}

- (void)loadCustomViewWithTotal:(NSInteger)totalStar
{
    //先铺背景图片（空的星星）
    for (int i =0 ; i<totalStar; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*starHeight+i*spaceWidth, self.frame.size.height-starHeight, starHeight, starHeight)];
        imageView.tag = starBaseTag+i;
        imageView.image = [UIImage imageNamed:@"starBackImage"];
        [self addSubview:imageView];
    }
    
}
//当你设置评分时 开始填充整颗星星
- (void)setCommentPoint:(CGFloat)commentPoint
{
    _commentPoint = commentPoint;
    
    CGFloat showNumber = commentPoint/singlePoint;
    
    //覆盖的长图
    starView = [[UIView alloc]init];
    //整颗星星
    NSInteger fullNumber = showNumber/1;
    starView.frame = CGRectMake(0, self.frame.size.height-starHeight, starHeight*showNumber+spaceWidth*fullNumber, starHeight);
    starView.clipsToBounds = YES;
    
    //在长图上填充完整的星星
    for (int j = 0; j< fullNumber; j++) {
        UIImageView *starImageView = [[UIImageView alloc]init];
        starImageView.image = [UIImage imageNamed:@"starImage"];
        starImageView.frame = CGRectMake(j*starHeight+j*spaceWidth, 0, starHeight, starHeight);
        [starView addSubview:starImageView];
    }

    CGFloat part = showNumber - fullNumber;
    //如果有残缺的星星 则添加
    if (part > 0) {
        UIImageView *partImage = [[UIImageView alloc]initWithFrame:CGRectMake(fullNumber*starHeight+fullNumber*spaceWidth, 0, starHeight, starHeight)];
        partImage.image = [UIImage imageNamed:@"starImage"];
        [starView addSubview:partImage];
    }
    
    [self addSubview:starView];
}

//设置星星的对齐方式
- (void)setStarAliment:(StarAliment)starAliment
{
    _starAliment = starAliment;
    
    switch (starAliment) {
        //居中对齐
        case StarAlimentCenter:
        {
            CGFloat starRealWidth = totalNumber*starHeight+(totalNumber-1)*spaceWidth;
            CGFloat leftWidth = self.frame.size.width-starRealWidth;
            
            for (int i =0 ; i< totalNumber; i++) {
                UIImageView *starImageView = (UIImageView*)[self viewWithTag:i+starBaseTag];
                starImageView.frame = CGRectMake(leftWidth/2+starImageView.frame.origin.x, starImageView.frame.origin.y, starImageView.frame.size.width, starImageView.frame.size.height);
            }
            
            starView.frame = CGRectMake(leftWidth/2+starView.frame.origin.x, starView.frame.origin.y, starView.frame.size.width, starView.frame.size.height);
 
        }
            break;
        //右对齐
      case StarAlimentRight:
        {
            CGFloat starRealWidth = totalNumber*starHeight+(totalNumber-1)*spaceWidth;
            CGFloat leftWidth = self.frame.size.width-starRealWidth;
            
            for (int i =0 ; i< totalNumber; i++) {
                UIImageView *starImageView = (UIImageView*)[self viewWithTag:i+starBaseTag];
                starImageView.frame = CGRectMake(leftWidth+starImageView.frame.origin.x, starImageView.frame.origin.y, starImageView.frame.size.width, starImageView.frame.size.height);
            }
            
            starView.frame = CGRectMake(leftWidth+starView.frame.origin.x, starView.frame.origin.y, starView.frame.size.width, starView.frame.size.height);

        }
            break;
        //默认的左对齐
            case StarAlimentDefault:
        {
            
            for (int i =0 ; i< totalNumber; i++) {
                UIImageView *starImageView = (UIImageView*)[self viewWithTag:i+starBaseTag];
                starImageView.frame = CGRectMake(i*starHeight+i*spaceWidth, self.frame.size.height-starHeight, starHeight, starHeight);
            }
            
            
            CGFloat showNumber = self.commentPoint/singlePoint;
            
            //整颗星星
            NSInteger fullNumber = showNumber/1;
            starView.frame = CGRectMake(0, self.frame.size.height-starHeight, starHeight*showNumber+spaceWidth*fullNumber, starHeight);


        }
            break;
        default:
        {
            
        }
            break;
    }
    
    
}


@end
