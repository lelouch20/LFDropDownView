//
//  ViewController.m
//  LFDropDownViewExample
//
//  Created by Firo on 2017/7/21.
//  Copyright © 2017年 Firo. All rights reserved.
//

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight    [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "LFDropDownView.h"

@interface ViewController ()<LFDropDownViewDelegate>

@property (nonatomic, strong) LFDropDownView *dropDownView;
@property (nonatomic, strong) UILabel *showLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviews];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addSubviews {
    
    [self.view addSubview:self.showLabel];
    [self.view addSubview:self.dropDownView];
    
}

#pragma mark - Lazy Load

- (UILabel *)showLabel {
    
    if (!_showLabel) {
        _showLabel = [UILabel new];
        CGRect rect = CGRectMake(0, 50.f, ScreenWidth, 30.f);
        _showLabel.frame = rect;
        _showLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _showLabel;
}

- (LFDropDownView *)dropDownView {
    
    if (!_dropDownView) {
        
        _dropDownView = [[LFDropDownView alloc] initWithFrame:CGRectMake((ScreenWidth - 250.f)/2, 110.f, 250.f, 40.f) titleList:@[@"I am title1", @"I am title2", @"I am title3", @"I am title4", @"I am title5"]];
        _dropDownView.selectDelegate = self;
        
    }
    return _dropDownView;
}

#pragma mark - LFDropDownViewDelegate

- (void)selectRowAtIndex:(NSInteger)index {
    
    NSString *text = [NSString stringWithFormat:@"Row %zi is selected!", index + 1];
    self.showLabel.text = text;
    
}



@end
