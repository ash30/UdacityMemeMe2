//
//  GeneralMemeCollectionViewCell.m
//  MemeMe2
//
//  Created by Ashley Arthur on 25/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UDCGeneralMemeCollectionViewCell.h"

@implementation UDCGeneralMemeCollectionViewCell

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.meme = [[UDCMemeView alloc] init];
        [self.contentView addSubview:_meme];
        
        _meme.translatesAutoresizingMaskIntoConstraints = false;
        [NSLayoutConstraint activateConstraints:@[
                                                  [_meme.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
                                                  [_meme.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
                                                  [_meme.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor],
                                                  [_meme.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor],
                                                  ]];
        
    }
    
    return self;
}

@end
