//
//  HGHRootView.m
//  Hedgehog
//
//  Created by Vladislav Solovyov on 23/11/2017.
//

#import "HGHRootView.h"

@implementation HGHRootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
    }
    return self;
}

- (void)layoutSubviews {
    _tableView.frame = self.bounds;
}

@end
