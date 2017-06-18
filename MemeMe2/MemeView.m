//
//  MemeView.m
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "MemeView.h"

@interface MemeView ()

@end

@implementation MemeView

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

        UIImageView * image = [[UIImageView alloc] init];
        image.translatesAutoresizingMaskIntoConstraints = false;
        
        NSArray<NSLayoutConstraint *> * constraints = @[
                                                        [header.topAnchor constraintEqualToAnchor: image.topAnchor],
                                                        [header.widthAnchor constraintEqualToAnchor: image.widthAnchor],
                                                        [header.centerXAnchor constraintEqualToAnchor: image.centerXAnchor],
                                                        
                                                        [footer.bottomAnchor constraintEqualToAnchor:image.bottomAnchor],
                                                        [footer.widthAnchor constraintEqualToAnchor:image.widthAnchor],
                                                        [footer.centerXAnchor constraintEqualToAnchor:image.centerXAnchor],
                                                        
                                                        [image.leftAnchor constraintEqualToAnchor: self.layoutMarginsGuide.leftAnchor],
                                                        [image.rightAnchor constraintEqualToAnchor: self.layoutMarginsGuide.rightAnchor],
                                                        [image.topAnchor constraintEqualToAnchor: self.layoutMarginsGuide.topAnchor],
                                                        [image.bottomAnchor constraintEqualToAnchor: self.layoutMarginsGuide.bottomAnchor]
                                                        
                                                        ];
        
        [self addSubview:image];
        [self addSubview:header];
        [self addSubview:footer];
        [NSLayoutConstraint activateConstraints:constraints];
        
    }
    return self;
}

@end
