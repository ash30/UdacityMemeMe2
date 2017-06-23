//
//  MemeDataSource+TableDataSource.m
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "MemeDataSource+UICollectionViewDataSource.h"

@implementation MemeDataSource (UICollectionViewDataSource)

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [[UICollectionViewCell alloc] init];
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"ic_add"];
    [cell.contentView addSubview:imageView];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.memeData count];
}

@end
