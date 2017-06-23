//
//  MemeCollectionViewController
//  MemeMe2
//
//  Created by Ashley Arthur on 23/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "MemeCollectionViewController.h"
#import "MemeDataSource.h"
#import "MemeDataSource+UICollectionViewDataSource.h"
#import "MemeViewController.h"

#pragma mark - CONSTANTS

static NSString * const kHeadingText = @"Memes";


#pragma mark - PRIVATE

@interface MemeCollectionViewController ()

@property (nonatomic) UICollectionView * memeCollection;
@property (nonatomic) MemeDataSource * dataSource;

@end

@implementation MemeCollectionViewController


#pragma mark - LIFE CYCLE

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // DATASOURCE
    self.dataSource = [[MemeDataSource alloc] init];
    
    
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
    UICollectionViewLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    self.memeCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout: layout ];
    _memeCollection.translatesAutoresizingMaskIntoConstraints = false;
    _memeCollection.backgroundColor = [UIColor whiteColor];
    _memeCollection.dataSource = _dataSource;

    [container addArrangedSubview:_memeCollection];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    // FIXME: NOT SAFE!
    MemeViewController * vc = [segue destinationViewController];
    vc.dataSource = _dataSource;
    
}

@end
