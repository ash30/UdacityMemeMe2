//
//  UDCMemeCollectionViewController+UICollectionViewDelegate.m
//  MemeMe2
//
//  Created by Ashley Arthur on 25/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UDCMemeCollectionViewController.h"

@implementation UDCMemeCollectionViewController (UICollectionViewDelegate)


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = self.memeCollection.bounds.size.width - (self.memeCollection.contentInset.left * 2 ) - (self.layout.sectionInset.left *2) - 2.0;
    width = MIN(width, self.memeCollection.bounds.size.height);
    
    return CGSizeMake(width,width);
}

@end
