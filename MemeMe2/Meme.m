//
//  Meme.m
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "Meme.h"

@implementation Meme

- (instancetype)initWithImage:(UIImage *)image header:(NSString *)header footer:(NSString *)footer
{
    self = [super init];
    if (self) {
        
        _image = image;
        _header = [header copy];
        _footer = [footer copy];
        _memeId = [[NSUUID alloc] init];
        
    }
    return self;
}

@end
