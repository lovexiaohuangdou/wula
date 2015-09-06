//
//  CCSlideView.h
//  SlideView
//
//  Created by its on 15/9/2.
//  Copyright © 2015年 coco. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, CCLayoutOptions) {
  CCLayoutFormatAlignAllLeft =0,
//  CCLayoutFormatAlignAllRigth =1,
  CCLayoutFormatAliginCenter = 2,
  CCLayoutFormatAliginBothSide = 3
};
@protocol CCSlideViewDataSource <NSObject>
- (NSArray *) slideViewWithTitles:(UIView *) view;
//- (NSArray *) slideViewWithController:(UIView *) view;
@end
@protocol CCSlideViewDelegate <NSObject>

@end
@interface CCSlideView : UIView
@property (nonatomic, strong) UIColor *fontColor; //字体颜色
@property (nonatomic, strong) UIColor *bottomColor;//低栏颜色
@property (nonatomic, assign) CGFloat fontSize;// 字体大小
@property (nonatomic, assign) CGFloat fontGap;//字体间隔
@property (nonatomic, assign) id<CCSlideViewDataSource> dataSource;
@property (nonatomic, assign) id<CCSlideViewDelegate> delegate;
@property (nonatomic, assign) CCLayoutOptions type;
@end
