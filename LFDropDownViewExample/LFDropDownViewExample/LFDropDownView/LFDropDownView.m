//
//  LFDropDownView.m
//  LFDropDownViewExample
//
//  Created by Firo on 2017/7/21.
//  Copyright © 2017年 Firo. All rights reserved.
//

#import "LFDropDownView.h"
#import "LFDropDownViewPlainCell.h"

@interface LFDropDownView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray<NSString*> *dataList;
@property (nonatomic, strong) NSMutableArray<NSString*> *showList;
@property (nonatomic, strong) UIButton *expandBtn;

@end

static NSInteger kShowRowNums = 5;
static NSString *plainCellIdentify = @"PlainCell";

@implementation LFDropDownView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.rowHeight = frame.size.height;
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, frame.size.width);
        self.separatorColor = [UIColor colorWithRed:236/255.f green:236/255.f blue:236/255.f alpha:1.f];
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = [UIColor colorWithRed:236/255.f green:236/255.f blue:236/255.f alpha:1.f].CGColor;
        self.layer.cornerRadius = frame.size.height / 2;
        self.layer.masksToBounds = YES;
        [self addExpandBtn];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame titleList:(NSArray<NSString*> *)titleList {
    
    self = [self initWithFrame:frame style:UITableViewStylePlain];
    
    self.dataList = titleList.copy;
    if (self.dataList.count > 0) {
       
        [self.showList addObject:self.dataList.firstObject];
        
    }
    [self registerClass:[LFDropDownViewPlainCell class] forCellReuseIdentifier:plainCellIdentify];

    
    return self;
}

#pragma mark - Lazy Load

- (NSArray<NSString *> *)dataList {
    
    if (!_dataList) {
        _dataList = [NSArray array];
    }
    return _dataList;
    
}

- (NSMutableArray<NSString *> *)showList {
    
    if (!_showList) {
        _showList = [NSMutableArray array];
    }
    return _showList;
    
}


#pragma mark - ExpandBtn

- (void)addExpandBtn {
    
    UIImageView *expandImage = [UIImageView new];
    CGRect rect = CGRectMake(self.bounds.size.width - 15.f - 9.f, (self.bounds.size.height - 5)/2 , 9, 5);
    expandImage.frame = rect;
    [expandImage setImage:[UIImage imageNamed:@"expandBtn"]];
    [self addSubview:expandImage];
    
    self.expandBtn = [UIButton new];
    self.expandBtn.frame = self.bounds;
    [self.expandBtn addTarget:self action:@selector(onClickExpandBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.expandBtn];
    
}

- (void)onClickExpandBtn:(UIButton *)sender {
    
    for (NSString *title in self.dataList) {
        if (![title isEqualToString:self.showList.firstObject]) {
            [self.showList addObject:title];
        }
    }
    [self expand];
    
}

- (void)expand {
    self.expandBtn.hidden = YES;
    NSInteger count = 0;
    if (self.rowNum) {
        
        count = self.showList.count > self.rowNum ? self.rowNum : self.showList.count;
        
    } else {
        
        count = self.showList.count > kShowRowNums ? kShowRowNums : self.showList.count;
    }
    [UIView animateWithDuration:0.3f animations:^{
        [self reloadData];
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.rowHeight * count);
    }];
    
}

- (void)collapse {
    
    self.expandBtn.hidden = NO;
    [UIView animateWithDuration:0.3f animations:^{
        
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.rowHeight);
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self reloadData];
        }
    }];
    
}

#pragma mark - UITableView DataSoure

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.rowHeight;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.showList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LFDropDownViewPlainCell *cell = [tableView dequeueReusableCellWithIdentifier:plainCellIdentify];
    [cell setText:self.showList[indexPath.row]];
    if (self.showList.count > 1 && (indexPath.row < self.showList.count - 1)) {
        cell.separatorInset = UIEdgeInsetsMake(0.5f, 0, 0, 0);
    }
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSInteger row = indexPath.row;
    LFDropDownViewPlainCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self.showList removeAllObjects];
    [self.showList addObject:cell.label.text];
    [self collapse];
    
    if (self.selectDelegate && [self.selectDelegate respondsToSelector:@selector(selectRowAtIndex:)]) {
        
        [self.selectDelegate selectRowAtIndex:row];
        
    }

}

@end
