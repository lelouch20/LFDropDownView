//
//  LFDropDownViewPlainCell.m
//  LFDropDownViewExample
//
//  Created by Firo on 2017/7/21.
//  Copyright © 2017年 Firo. All rights reserved.
//

#import "LFDropDownViewPlainCell.h"

@interface LFDropDownViewPlainCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation LFDropDownViewPlainCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initSubViews];
        
    }
    return self;
}

- (void)initSubViews {
    
    self.label = [UILabel new];
    self.label.text = @"";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.label];
    
}

- (void)setText:(NSString *)text {
    
    if (text && text.length > 0) {
        
        self.label.text = text;
        
    }
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGRect rect = CGRectMake(15.f, 0, self.bounds.size.width - 2 * 15.f, self.bounds.size.height);
    self.label.frame = rect;
    
}

@end
