//
//  MemeView.m
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "MemeView.h"

@interface MemeView ()

@property (nonatomic, nonnull) UIImageView * memeImageView;

@end

@implementation MemeView

#pragma mark GET SET

- (UIImage *) getMemeImage {
    return self.memeImageView.image;
}

- (void) setMemeImage:(UIImage *)memeImage {
    [self.memeImageView setImage:memeImage];
}

#pragma mark - INIT

- (instancetype) init {
    self = [self initWithFrame:CGRectZero];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self){
        
        //UICollectionView * container = [
        UITextField * header = [[UITextField alloc] init];
        header.text = @"TOP";
        header.textAlignment = NSTextAlignmentCenter;
        header.translatesAutoresizingMaskIntoConstraints = false;
        
        UITextField * footer = [[UITextField alloc] init];
        footer.text = @"BOTTOM";
        footer.textAlignment = NSTextAlignmentCenter;
        footer.translatesAutoresizingMaskIntoConstraints = false;

        _memeImageView = [[UIImageView alloc] init];
        _memeImageView.translatesAutoresizingMaskIntoConstraints = false;
        
        NSArray<NSLayoutConstraint *> * constraints = @[
                                                        [header.topAnchor constraintEqualToAnchor: _memeImageView.topAnchor],
                                                        [header.widthAnchor constraintEqualToAnchor: _memeImageView.widthAnchor],
                                                        [header.centerXAnchor constraintEqualToAnchor: _memeImageView.centerXAnchor],
                                                        
                                                        [footer.bottomAnchor constraintEqualToAnchor:_memeImageView.bottomAnchor],
                                                        [footer.widthAnchor constraintEqualToAnchor:_memeImageView.widthAnchor],
                                                        [footer.centerXAnchor constraintEqualToAnchor:_memeImageView.centerXAnchor],
                                                        
                                                        [_memeImageView.leftAnchor constraintEqualToAnchor: self.layoutMarginsGuide.leftAnchor],
                                                        [_memeImageView.rightAnchor constraintEqualToAnchor: self.layoutMarginsGuide.rightAnchor],
                                                        [_memeImageView.topAnchor constraintEqualToAnchor: self.layoutMarginsGuide.topAnchor],
                                                        [_memeImageView.bottomAnchor constraintEqualToAnchor: self.layoutMarginsGuide.bottomAnchor]
                                                        
                                                        ];
        
        [self addSubview:_memeImageView];
        [self addSubview:header];
        [self addSubview:footer];
        [NSLayoutConstraint activateConstraints:constraints];
        
    }
    return self;
}

@end
