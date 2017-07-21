//
//  LFDropDownView.h
//  LFDropDownViewExample
//
//  Created by Firo on 2017/7/21.
//  Copyright © 2017年 Firo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFDropDownViewDelegate <NSObject>

- (void)selectRowAtIndex:(NSInteger)index;

@end

@interface LFDropDownView : UITableView

@property (nonatomic, assign) NSInteger rowNum;

@property (nonatomic, weak) id<LFDropDownViewDelegate>selectDelegate;

- (instancetype)initWithFrame:(CGRect)frame titleList:(NSArray<NSString*> *)titleList;

@end
