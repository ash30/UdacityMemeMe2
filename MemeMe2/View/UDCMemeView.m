//
//  MemeView.m
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UDCMemeView.h"
#import "UDCVerticalTextView.h"

#pragma mark - PRIVATE

@interface UDCMemeView ()

@property (nonatomic, nonnull) UIImageView * memeImageView;
@property (nonatomic, nonnull) UITextView * header;
@property (nonatomic, nonnull) UDCVerticalTextView * footer;

@end

#pragma mark - VIEW

@implementation UDCMemeView

#pragma mark - ACCESSORS

- (UIImage *) memeImage {
    return self.memeImageView.image;
}

- (void) setMemeImage:(UIImage *)memeImage {
    [self.memeImageView setImage:memeImage];
}

- (id<UITextViewDelegate>)getTextDelegate{
    return _header.delegate;
}

- (void)setTextDelegate:(id<UITextViewDelegate>)textDelegate {
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
        
        self.header = [[UITextView alloc] init];
        _header.backgroundColor = nil;
        _header.textAlignment = NSTextAlignmentCenter;
        _header.translatesAutoresizingMaskIntoConstraints = false;
        
        self.footer = [[UDCVerticalTextView alloc] init];
        _footer.backgroundColor = nil;
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
                                                        [_header.heightAnchor constraintEqualToAnchor:_memeImageView.heightAnchor multiplier:0.5],

                                                        
                                                        [_footer.bottomAnchor constraintEqualToAnchor:_memeImageView.bottomAnchor],
                                                        [_footer.widthAnchor constraintEqualToAnchor:_memeImageView.widthAnchor],
                                                        [_footer.centerXAnchor constraintEqualToAnchor:_memeImageView.centerXAnchor],
                                                        [_footer.heightAnchor constraintEqualToAnchor:_memeImageView.heightAnchor multiplier:0.5],
                                                        
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
