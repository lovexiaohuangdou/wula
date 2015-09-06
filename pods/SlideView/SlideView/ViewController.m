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
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSArray *) slideViewWithTitles:(UIView *) view {
    return @[@"测试一",@"测试二",@"测试三",@"测试四",@"测试五"];
}
#pragma mark slide view data source

@end
