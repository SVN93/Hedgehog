//
//  HGHImageCellModel.h
//  Hedgehog
//
//  Created by Vladislav Solovyov on 23/11/2017.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HGHImageCellModel : NSObject
@property (nonatomic, nonnull) NSString *imagePath;
@property (nonatomic, readonly, nullable) UIImage *image;
- (instancetype _Nonnull)initWithImagePath:(NSString * _Nonnull)imagePath;
@end
