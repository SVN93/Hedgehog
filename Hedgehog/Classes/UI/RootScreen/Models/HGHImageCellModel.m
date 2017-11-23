//
//  HGHImageCellModel.m
//  Hedgehog
//
//  Created by Vladislav Solovyov on 23/11/2017.
//

#import "HGHImageCellModel.h"

@implementation HGHImageCellModel

- (instancetype)initWithImagePath:(NSString *)imagePath {
    self = [super init];
    if (self) {
        _imagePath = imagePath;
    }
    return self;
}

- (UIImage *)image {
    UIImage *image = nil;
    if (_imagePath.length) {
        image = [UIImage imageWithContentsOfFile:_imagePath];
    }
    
    return image;
}

@end
