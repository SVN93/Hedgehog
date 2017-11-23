//
//  HGHImageTableViewCell.m
//  Hedgehog
//
//  Created by Vladislav Solovyov on 23/11/2017.
//

#import "HGHImageTableViewCell.h"

@implementation HGHImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _contentImageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.contentView.bounds, 10.f, 10.f)];
//        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _contentImageView.layer.cornerRadius = 10.f;
        _contentImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_contentImageView];
        
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -1 / 500.0;
        transform = CATransform3DRotate(transform, -.45 * M_PI_2, 1, 0, 0);
        _contentImageView.layer.transform = transform;
    }
    
    return self;
}

- (void)setNeedsLayout {
    [super setNeedsLayout];
    _contentImageView.frame = ({
        CGRect frame = CGRectInset(self.contentView.bounds, 10.f, 10.f);
        if (_contentImageView.image) {
            frame.size.width = _contentImageView.image.size.width * frame.size.height / _contentImageView.image.size.height;
            frame.origin.x = self.bounds.size.width / 2 - frame.size.width / 2;
        }
        
        frame;
    });
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _model = nil;
}

- (void)setModel:(HGHImageCellModel *)model {
    if (!_model || (_model != model)) {
        _model = model;
        _contentImageView.image = [_model image];
        [self setNeedsLayout];
    }
}

@end
