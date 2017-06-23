//
//  MemeDataSource.h
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Meme;

@interface MemeDataSource : NSObject

@property (nonatomic, readonly) NSArray<Meme*> * memeData;

- (void)addNewMeme: (Meme *) meme;

@end
