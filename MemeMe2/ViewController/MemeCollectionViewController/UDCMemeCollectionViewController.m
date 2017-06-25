//
//  MemeCollectionViewController
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UDCMemeCollectionViewController.h"

#import "UDCMemeViewController.h"
#import "UDCMemeDataSource.h"
#import "UDCMemeDataSource+UICollectionViewDataSource.h"
#import "UDCMemeDataSourceObserver.h"
#import "UDCMutableMeme.h"
#import "UDCGeneralMemeCollectionViewCell.h"

#pragma mark - CONSTANTS

static NSString * const kHeadingText = @"Memes";


#pragma mark - PRIVATE

@interface UDCMemeCollectionViewController () <UDCMemeDataSourceObserver, UICollectionViewDelegate>
@property (nonatomic) UDCMemeDataSource * dataSource;
@property (nonatomic) NSUInteger pendingUpdates;

@end

@implementation UDCMemeCollectionViewController


#pragma mark - VIEW SETUP

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // DATASOURCE
    self.dataSource = [[UDCMemeDataSource alloc] init];
    self.dataSource.observer = self;
    
    
    // CONTAINER
    
    UIStackView * container = [[UIStackView alloc] init];
    [self.view addSubview:container];
    container.translatesAutoresizingMaskIntoConstraints = false;
    container.distribution = UIStackViewDistributionFill;
    container.axis = UILayoutConstraintAxisVertical;
    container.alignment = UIStackViewAlignmentFill;
    container.spacing = 16.0;
    
    [ NSLayoutConstraint activateConstraints:@[
                                               [container.topAnchor constraintEqualToAnchor: self.topLayoutGuide.bottomAnchor],
                                               [container.bottomAnchor constraintEqualToAnchor: self.bottomLayoutGuide.topAnchor],
                                               [self.view.layoutMarginsGuide.leftAnchor constraintEqualToAnchor:container.leftAnchor],
                                               [self.view.layoutMarginsGuide.rightAnchor constraintEqualToAnchor:container.rightAnchor],
                                               ]];
    
    
    // TITLE
    UILabel * title = [[UILabel alloc] init];
    title.translatesAutoresizingMaskIntoConstraints = false;
    title.text = kHeadingText;
    UIFontDescriptor * style = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1];
    title.font = [UIFont fontWithDescriptor:style size:32.0];
    [container addArrangedSubview:title];
    
    
    // COLLECTION VIEW
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.memeCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout: _layout ];
    _memeCollection.translatesAutoresizingMaskIntoConstraints = false;
    _memeCollection.backgroundColor = [UIColor whiteColor];
    _memeCollection.delegate = self;
    _memeCollection.dataSource = _dataSource;
    [_memeCollection registerClass:[UDCGeneralMemeCollectionViewCell class] forCellWithReuseIdentifier:@"MEMECELL"];

    [container addArrangedSubview:_memeCollection];
    
}

#pragma mark - LIFE CYCLE

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    
    [_layout invalidateLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (_pendingUpdates > 0) {
        
        NSMutableArray<NSIndexPath *> * indexes = [[NSMutableArray alloc] init];
        for (NSUInteger i=0;i< _pendingUpdates;i++){
            [indexes addObject:[NSIndexPath indexPathForItem:i inSection:0]];
        }
        
        [_memeCollection performBatchUpdates:^{
            [_memeCollection insertItemsAtIndexPaths:indexes];
        } completion:^(BOOL finished) {
            [_memeCollection reloadData];
            self.pendingUpdates = 0;
        }];
    }
}

#pragma mark - NAVIGATION

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    // FIXME: NOT SAFE!
    UDCMemeViewController * vc = [segue destinationViewController];
    UDCMutableMeme * newMeme = [[UDCMutableMeme alloc] initWithImage:nil header:nil footer:nil];
    [self.dataSource addNewMeme:newMeme];
    vc.currentMemeId = newMeme.memeId;
    vc.dataSource = _dataSource;
    
}

#pragma mark - DATA SOURCE OBSERVER

- (void)memeDataSourceDidChange:(UDCMemeDataSource *)dataSource change:(MemeDataSourceObserverChange)change {
    
    if (change == MemeDataSourceObserverChangeMemeAdded){
        self.pendingUpdates += 1;
    }
}

@end
