//
//  MemeDataSource+TableDataSource.m
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "MemeDataSource+UICollectionViewDataSource.h"
#import "MemeDataSource.h"
#import "GeneralMemeCollectionViewCell.h"
#import "Meme.h"

static NSString * const memeCellReuseIdent = @"MEMECELL";

@implementation MemeDataSource (UICollectionViewDataSource)

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GeneralMemeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:memeCellReuseIdent forIndexPath:indexPath];
    
    if (!(indexPath.item < self.count)){
        return cell;
    }
    Meme * data = [self.elements objectAtIndex:indexPath.item];
    cell.imageView.image = data.image;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.count;
}

@end
