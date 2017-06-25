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

@property (nonnull, nonatomic, readonly) NSUUID * memeId;
@property (nullable, nonatomic, readonly) UIImage * image;
@property (nullable, nonatomic, readonly, copy) NSString * header;
@property (nullable, nonatomic, readonly, copy) NSString * footer;

- (nonnull instancetype)initWithImage:( UIImage * _Nullable )image header:(NSString * _Nullable)header footer:(NSString * _Nullable)footer;


@end
