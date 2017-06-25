//
//  MemeDataSource.m
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "MemeDataSource.h"
#import "MutableMeme.h"


@interface MemeDataSource ()

@property (nonatomic) NSMutableDictionary<NSUUID *, MutableMeme *> * idCache;
@property (nonatomic) NSMutableArray<MutableMeme *> * elements;

@end

@implementation MemeDataSource

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

- (void)addNewMeme: (MutableMeme *) meme {
    [_idCache setObject:meme forKey:meme.memeId];
    [_elements insertObject:meme atIndex:0];
    [self.observer memeDataSourceDidChange:self change:MemeDataSourceObserverChangeMemeAdded];
}

- (BOOL)editExistingMemeWithID: (NSUUID *) memeID usingBlock: (void (^)(MutableMeme *))edit {
    
    MutableMeme * meme = [_idCache objectForKey:memeID];
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
