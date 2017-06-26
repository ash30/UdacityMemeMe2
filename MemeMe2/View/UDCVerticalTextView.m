//
//  UDCVerticalTextView.m
//  MemeMe2
//
//  Created by Ashley Arthur on 25/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UDCVerticalTextView.h"

@interface UDCVerticalTextView ()

@property CGFloat offsetCache;

@end


@implementation UDCVerticalTextView

- (void)setText:(NSString *)text {
    [super setText:text];
    [self alignTextToBottom];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    [self alignTextToBottom];
}

- (void)alignTextToBottom {
    // This only works if autolayout has happened already
    // if bounds is zero we force layout and then calculate
    if (!self.bounds.size.height){
        [self layoutIfNeeded];
        [self alignTextToBottom];
    }
    CGFloat offset = self.bounds.size.height - self.contentSize.height;
    self.contentInset = UIEdgeInsetsMake(offset, 0, 0, 0);
}

@end
