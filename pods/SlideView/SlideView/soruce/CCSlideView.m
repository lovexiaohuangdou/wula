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
    [self.scrollview addSubview:_containView];
    
    _buttonArray = [NSMutableArray array];
      self.translatesAutoresizingMaskIntoConstraints = NO;
      self.scrollview.translatesAutoresizingMaskIntoConstraints = NO;
      [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_scrollview]-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(_scrollview)]];
      [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_scrollview]-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(_scrollview)]];

  }
  return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        _scrollview = [UIScrollView new];
        self.scrollview.backgroundColor = [UIColor redColor];
        [self addSubview:_scrollview];
        _buttonArray = [NSMutableArray array];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.scrollview.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_scrollview]-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(_scrollview)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_scrollview]-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(_scrollview)]];

    }
    return self;
}

- (void) layoutSubviews {
    [self setupView];
    [super layoutSubviews];
}
- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
//    [self setupView];
}

- (void) didMoveToSuperview {
    
}
- (void) setupView {
  if ([_dataSource respondsToSelector:@selector(slideViewWithTitles:)]) {
    NSArray *titles = [_dataSource slideViewWithTitles: self];
    for (int i = 0; i < titles.count; i++) {
      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      [button setTitle:titles[i] forState:UIControlStateNormal];
      button.tag = i + 100;
      [_buttonArray addObject: button];
      [button sizeToFit];
        NSLog(@"button %f", button.frame.size.width);
    }
    switch (self.type) {
      case CCLayoutFormatAlignAllLeft: {
        UIButton *originButton;
        for (UIButton *button in self.buttonArray) {
            button.translatesAutoresizingMaskIntoConstraints = NO;
            [self.scrollview addSubview: button];
          if (originButton == nil) {
            [self.scrollview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[button]" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(button)]];
              [self.scrollview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button]" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(button)]];
              
          } else {
              [self.scrollview addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:originButton
                                                                          attribute:NSLayoutAttributeRight
                                                                         multiplier:1
                                                                           constant:0]];
              [self.scrollview addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:originButton
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1
                                                                           constant:0]];

          }
            originButton = button;
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
