//
//  MemeView.m
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "MemeView.h"

#pragma mark - PRIVATE

@interface MemeView ()

@property (nonatomic, nonnull) UIImageView * memeImageView;
@property (nonatomic, nonnull) UITextField * header;
@property (nonatomic, nonnull) UITextField * footer;

@end

#pragma mark - VIEW

@implementation MemeView

#pragma mark - ACCESSORS

- (UIImage *) getMemeImage {
    return self.memeImageView.image;
}

- (void) setMemeImage:(UIImage *)memeImage {
    [self.memeImageView setImage:memeImage];
}

- (id<UITextFieldDelegate>)getTextDelegate{
    return _header.delegate;
}

- (void)setTextDelegate:(id<UITextFieldDelegate>)textDelegate {
    _header.delegate = textDelegate;
    _footer.delegate = textDelegate;
}

#pragma mark - INIT

- (instancetype) init {
    self = [self initWithFrame:CGRectZero];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self){
        
        self.header = [[UITextField alloc] init];
        _header.placeholder = @"Enter Heading Text";
        _header.textAlignment = NSTextAlignmentCenter;
        _header.translatesAutoresizingMaskIntoConstraints = false;
        
        self.footer = [[UITextField alloc] init];
        _footer.placeholder = @"Enter Footer Text";
        _footer.textAlignment = NSTextAlignmentCenter;
        _footer.translatesAutoresizingMaskIntoConstraints = false;

        self.memeImageView = [[UIImageView alloc] init];
        _memeImageView.translatesAutoresizingMaskIntoConstraints = false;
        _memeImageView.contentMode = UIViewContentModeScaleAspectFill;
        _memeImageView.clipsToBounds = true;
        
        NSArray<NSLayoutConstraint *> * constraints = @[
                                                        [_header.topAnchor constraintEqualToAnchor: _memeImageView.topAnchor],
                                                        [_header.widthAnchor constraintEqualToAnchor: _memeImageView.widthAnchor],
                                                        [_header.centerXAnchor constraintEqualToAnchor: _memeImageView.centerXAnchor],
                                                        
                                                        [_footer.bottomAnchor constraintEqualToAnchor:_memeImageView.bottomAnchor],
                                                        [_footer.widthAnchor constraintEqualToAnchor:_memeImageView.widthAnchor],
                                                        [_footer.centerXAnchor constraintEqualToAnchor:_memeImageView.centerXAnchor],
                                                        
                                                        [_memeImageView.leftAnchor constraintEqualToAnchor: self.layoutMarginsGuide.leftAnchor],
                                                        [_memeImageView.rightAnchor constraintEqualToAnchor: self.layoutMarginsGuide.rightAnchor],
                                                        [_memeImageView.topAnchor constraintEqualToAnchor: self.layoutMarginsGuide.topAnchor],
                                                        [_memeImageView.bottomAnchor constraintEqualToAnchor: self.layoutMarginsGuide.bottomAnchor]
                                                        
                                                        ];
        
        [self addSubview:_memeImageView];
        [self addSubview:_header];
        [self addSubview:_footer];
        [NSLayoutConstraint activateConstraints:constraints];
        
    }
    return self;
}



@end
