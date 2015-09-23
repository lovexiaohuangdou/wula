//
//  ViewController.m
//  SlideView
//
//  Created by its on 15/9/2.
//  Copyright © 2015年 coco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CCSlideView *slideView;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.slideView.dataSource = self;
    [self.slideView setupView];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {

    NSLog(@"%f",    self.slideView.scrollview.contentSize.width);
    [super viewDidAppear:animated];
}
- (NSArray *) slideViewWithTitles:(UIView *) view {
    return @[@"测试一111",@"测试一111",@"测试一111",@"测试一111",@"测试一111",@"测试一111"];
}
#pragma mark slide view data source

@end
