//
//  MutableMeme.h
//  MemeMe2
//
//  Created by Ashley Arthur on 24/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Meme.h"


@interface MutableMeme : Meme

@property (nullable, nonatomic) UIImage * image;
@property (nullable, nonatomic, copy) NSString * header;
@property (nullable, nonatomic, copy) NSString * footer;



@end
