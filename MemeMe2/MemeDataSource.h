//
//  MemeDataSource.h
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemeDataSourceObserver.h"

@class Meme;
@class MutableMeme;

@interface MemeDataSource : NSObject

@property (nonatomic, readonly) NSArray<Meme *> * elements;
@property (nonatomic, readonly) NSUInteger count;


@property (nonatomic) id<MemeDataSourceObserver> observer;

- (void)addNewMeme: (MutableMeme *) meme;
- (BOOL)editExistingMemeWithID: (NSUUID *) memeID usingBlock: (void (^)(MutableMeme *))edit;

- (Meme *)memeAtIndex:(NSUInteger)index;

@end
