//
//  CCSlideView.m
//  SlideView
//
//  Created by its on 15/9/2.
//  Copyright © 2015年 coco. All rights reserved.
//

#import "CCSlideView.h"


@interface CCSlideView()
@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) UIView *containView;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@end

@implementation CCSlideView

- (instancetype) initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    _scrollview = [UIScrollView new];
    self.scrollview.backgroundColor = [UIColor redColor];
    [self addSubview:_scrollview];
    _containView = [UIView new];
    [self.scrollview addSubview:_containView];
    
    _buttonArray = [NSMutableArray array];
  }
  return self;
}

- (void) layoutSubviews {
  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|_scrollview|" options:NSLayoutFormatAlignAllTrailing metrics:@{} views:NSDictionaryOfVariableBindings(_scrollview)]];
  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"v:|_scrollview|" options:NSLayoutFormatAlignAllTrailing metrics:@{} views:NSDictionaryOfVariableBindings(_scrollview)]];
  [super layoutSubviews];
}

- (void) setupView {
  if ([_dataSource performSelector:@selector(slideViewWithTitles:)]) {
    NSArray *titles = [_dataSource slideViewWithTitles: self];
    for (int i = 0; i < titles.count; i++) {
      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      [button setTitle:titles[i] forState:UIControlStateNormal];
      button.tag = i + 100;
      [_buttonArray addObject: button];
      [button sizeToFit];
    }
    switch (self.type) {
      case CCLayoutFormatAlignAllLeft: {
        UIButton *originButton;
        for (UIButton *button in self.buttonArray) {
          if (originButton == nil) {
            [self.containView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-button" options:NSLayoutFormatAlignAllTrailing metrics:@{} views:NSDictionaryOfVariableBindings(button)]];
          } else {
            [self.containView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"(originButton)-_fontGap-button" options:NSLayoutFormatAlignAllTrailing metrics:@{} views:NSDictionaryOfVariableBindings(button)]];
            
          }
          
        }
      }
        break;
//      case CCLayoutFormatAlignAllRigth:
//        break;
      case CCLayoutFormatAliginCenter:
        break;
        case CCLayoutFormatAliginBothSide:
        break;
      default:
        break;
    }
  }
}
@end
