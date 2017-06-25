//
//  Meme.m
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UDCMeme.h"

@interface UDCMeme ()

@property (nullable, nonatomic) UIImage * image;
@property (nullable, nonatomic, copy) NSString * header;
@property (nullable, nonatomic, copy) NSString * footer;

@end

@implementation UDCMeme

- (nonnull instancetype)initWithImage:( UIImage * _Nullable )image header:(NSString * _Nullable)header footer:(NSString * _Nullable)footer
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

- (instancetype)init{
    // Cannot have a Meme without passing in the values
    [NSException raise:@"InitNotImplemented" format:@"Subclasses must implement a valid init method"];
    return self;
}

@end
