//
//  UDCVerticalTextView.m
//  MemeMe2
//
//  Created by Ashley Arthur on 25/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UDCVerticalTextView.h"

@implementation UDCVerticalTextView

- (void)setText:(NSString *)text {
    [super setText:text];
    [self alignTextToBottom];
}

- (void)alignTextToBottom {
    CGFloat offset = self.bounds.size.height - self.contentSize.height;
    self.contentOffset = CGPointMake(0.0, -offset);
}

@end
