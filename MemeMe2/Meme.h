//
//  Meme.h
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Meme : NSObject

@property (nonnull, nonatomic, readonly) UIImage * image;
@property (nonnull, nonatomic, readonly, copy) NSString * header;
@property (nonnull, nonatomic, readonly, copy) NSString * footer;
@property (nonnull, nonatomic, readonly) NSUUID * memeId;

- (instancetype)initWithImage:(UIImage *)image header:(NSString *)header footer:(NSString *)footer;


@end
