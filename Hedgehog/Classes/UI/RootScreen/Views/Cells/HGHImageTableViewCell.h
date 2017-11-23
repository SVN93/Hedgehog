//
//  HGHImageTableViewCell.h
//  Hedgehog
//
//  Created by Vladislav Solovyov on 23/11/2017.
//

#import <UIKit/UIKit.h>
#import "HGHImageCellModel.h"

@interface HGHImageTableViewCell : UITableViewCell
@property (nonatomic, readonly) UIImageView *contentImageView;
@property (nonatomic) HGHImageCellModel *model;
@end
