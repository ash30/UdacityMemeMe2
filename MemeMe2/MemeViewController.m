//
//  ViewController.m
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "MemeViewController.h"
#import "MemeView.h"


#pragma mark - CONSTANTS

static const CGFloat kContentViewMargin = 16;


#pragma mark - PRIVATE

@interface MemeViewController ()

@property (readwrite) float memeAspectRatio;
@property (nonatomic) UIView * contentView;

@end


#pragma mark - VIEW CONTROLLER

@implementation MemeViewController


#pragma mark - LIFE CYCLE

- (void)viewDidLoad {
    [super viewDidLoad];

    // CONTENT VIEW
    _contentView = [[UIView alloc] init];
    _contentView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:_contentView];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [_contentView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor constant:kContentViewMargin],
                                              [_contentView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor constant:-kContentViewMargin],
                                              [_contentView.topAnchor constraintEqualToAnchor: self.view.layoutMarginsGuide.topAnchor constant:kContentViewMargin],
                                              [_contentView.bottomAnchor constraintEqualToAnchor: self.view.layoutMarginsGuide.bottomAnchor constant:-kContentViewMargin]
                                              ]];
    

    // MEME VIEW
    
    _memeView = [[MemeView alloc] init];
    _memeView.translatesAutoresizingMaskIntoConstraints = false ;
    [self.contentView addSubview:_memeView];
    
    _memeAspectRatio = 0.9;
    // Maintain aspect ratio and fill shortest screen dimension
    [ NSLayoutConstraint activateConstraints:@[
                                               [_memeView.widthAnchor constraintLessThanOrEqualToAnchor: _contentView.heightAnchor multiplier:_memeAspectRatio],
                                               [_memeView.heightAnchor constraintLessThanOrEqualToAnchor: _contentView.widthAnchor multiplier: (1 / _memeAspectRatio)],

                                               [_memeView.widthAnchor constraintLessThanOrEqualToAnchor: _contentView.widthAnchor],
                                               [_memeView.heightAnchor constraintLessThanOrEqualToAnchor: _contentView.heightAnchor],

                                               [_memeView.centerXAnchor constraintEqualToAnchor: _contentView.centerXAnchor],
                                               [_memeView.centerYAnchor constraintEqualToAnchor: _contentView.centerYAnchor]
                                               ]];
    
    # pragma mark - NAV BAR BUTTON

    navBarButtonR.target = self;
    navBarButtonR.action = @selector(showImagePicker);
    
}

- (void) showImagePicker {
    UIImagePickerController * vc = [[ UIImagePickerController alloc ] init];
    if (vc) {
        vc.delegate = self;
        [self presentViewController:vc animated:true completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
