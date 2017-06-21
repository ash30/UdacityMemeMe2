//
//  ImagePlaceHolder.m
//  MemeMe2
//
//  Created by Ashley Arthur on 21/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "ImagePlaceHolder.h"

@interface ImagePlaceHolder ()

@property (nonatomic) UIImageView * imageIcon;

@end


@implementation ImagePlaceHolder

#pragma mark - INIT

- (instancetype) init {
    self = [self initWithFrame:CGRectZero];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self){
        
        // LAYER
        self.layer.backgroundColor = [[UIColor whiteColor] CGColor];
        self.layer.cornerRadius = 4.0;
        self.layer.shadowOffset = CGSizeMake(0, 24.0);
        self.layer.shadowRadius = 32.0;
        self.layer.shadowOpacity = 0.2;
        
        // IMAGE
        self.imageIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_add"]];
        _imageIcon.translatesAutoresizingMaskIntoConstraints = false;
        [self addSubview:_imageIcon];
        
        [ NSLayoutConstraint activateConstraints:@[
                                                   [_imageIcon.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                   [_imageIcon.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                                   ]];

        
    }
    return self;
}



@end
