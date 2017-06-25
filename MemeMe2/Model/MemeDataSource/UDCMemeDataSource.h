//
//  MemeDataSource.h
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UDCMemeDataSourceObserver.h"

@class UDCMeme;
@class UDCMutableMeme;

@interface UDCMemeDataSource : NSObject

@property (nonatomic, readonly) NSArray<UDCMeme *> * elements;
@property (nonatomic, readonly) NSUInteger count;


@property (nonatomic) id<UDCMemeDataSourceObserver> observer;

- (void)addNewMeme: (UDCMutableMeme *) meme;
- (BOOL)editExistingMemeWithID: (NSUUID *) memeID usingBlock: (void (^)(UDCMutableMeme *))edit;

- (UDCMeme *)memeAtIndex:(NSUInteger)index;

@end
