//
//  LFDropDownView.h
//  LFDropDownViewExample
//
//  Created by Firo on 2017/7/21.
//  Copyright © 2017年 Firo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFDropDownViewDelegate <NSObject>
//The callback of select
- (void)selectRowAtIndex:(NSInteger)index;

@end

@interface LFDropDownView : UITableView
//Set Max number of rows to show
@property (nonatomic, assign) NSInteger rowNum;
@property (nonatomic, readonly) NSMutableArray<NSString*> *showList;
@property (nonatomic, weak) id<LFDropDownViewDelegate>selectDelegate;

- (instancetype)initWithFrame:(CGRect)frame titleList:(NSArray<NSString*> *)titleList;

@end
