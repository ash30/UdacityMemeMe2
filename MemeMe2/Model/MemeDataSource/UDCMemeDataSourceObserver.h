//
//  MemeDataSourceObserver.h
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UDCMemeDataSource;

typedef NS_ENUM(NSUInteger, MemeDataSourceObserverChange) {
    MemeDataSourceObserverChangeMemeAdded,
    MemeDataSourceObserverChangeMemeDelete,
    MemeDataSourceObserverChangeMemeChanged
};

@protocol UDCMemeDataSourceObserver <NSObject>

- (void)memeDataSourceDidChange:(UDCMemeDataSource *)dataSource change:(MemeDataSourceObserverChange) change;

@end
