//
//  LFDropDownViewPlainCell.h
//  LFDropDownViewExample
//
//  Created by Firo on 2017/7/21.
//  Copyright © 2017年 Firo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFDropDownViewPlainCell : UITableViewCell

@property (nonatomic, readonly) UILabel *label;

- (void)setText:(NSString *)text;

@end
