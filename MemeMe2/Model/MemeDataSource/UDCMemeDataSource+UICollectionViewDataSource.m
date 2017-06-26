//
//  MemeDataSource+TableDataSource.m
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UDCMemeDataSource+UICollectionViewDataSource.h"
#import "UDCMemeDataSource.h"
#import "UDCGeneralMemeCollectionViewCell.h"
#import "UDCMeme.h"

static NSString * const memeCellReuseIdent = @"MEMECELL";

@implementation UDCMemeDataSource (UICollectionViewDataSource)

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UDCGeneralMemeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:memeCellReuseIdent forIndexPath:indexPath];
    
    if (!(indexPath.item < self.count)){
        return cell;
    }
    UDCMeme * data = [self.elements objectAtIndex:indexPath.item];
    [cell.meme displayMeme:data];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.count;
}

@end
