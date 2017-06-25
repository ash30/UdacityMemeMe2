//
//  MemeDataSource.m
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UDCMemeDataSource.h"
#import "UDCMutableMeme.h"


@interface UDCMemeDataSource ()

@property (nonatomic) NSMutableDictionary<NSUUID *, UDCMutableMeme *> * idCache;
@property (nonatomic) NSMutableArray<UDCMutableMeme *> * elements;

@end

@implementation UDCMemeDataSource

- (NSUInteger)count {
    return [_elements count];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.idCache = [[NSMutableDictionary alloc ] init];
        self.elements = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addNewMeme: (UDCMutableMeme *) meme {
    [_idCache setObject:meme forKey:meme.memeId];
    [_elements insertObject:meme atIndex:0];
    [self.observer memeDataSourceDidChange:self change:MemeDataSourceObserverChangeMemeAdded];
}

- (BOOL)editExistingMemeWithID: (NSUUID *) memeID usingBlock: (void (^)(UDCMutableMeme *))edit {
    
    UDCMutableMeme * meme = [_idCache objectForKey:memeID];
    if (meme){
        edit(meme);
        [self.observer memeDataSourceDidChange:self change:MemeDataSourceObserverChangeMemeChanged];
        return true;
    }
    else {
        return false; // ID doesn't exist
    }
}



@end
