//
//  GeneralMemeCollectionViewCell.m
//  MemeMe2
//
//  Created by Ashley Arthur on 25/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "GeneralMemeCollectionViewCell.h"

@implementation GeneralMemeCollectionViewCell

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        
        _imageView.translatesAutoresizingMaskIntoConstraints = false;
        [NSLayoutConstraint activateConstraints:@[
                                                  [_imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
                                                  [_imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
                                                  [_imageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor],
                                                  [_imageView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor],
                                                  ]];
        
    }
    
    return self;
}

@end
