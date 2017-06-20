//
//  ViewController.m
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "MemeViewController.h"
#import "MemeView.h"


@interface MemeViewController ()

@property (readwrite) float memeAspectRatio;


@end

@implementation MemeViewController

#pragma mark - LIFE CYCLE

- (void)viewDidLoad {
    [super viewDidLoad];


    #pragma mark - MEME VIEW
    
    _memeView = [[MemeView alloc] init];
    _memeView.translatesAutoresizingMaskIntoConstraints = false ;
    [self.view addSubview:_memeView];
    
    
    _memeAspectRatio = 0.9;
    // Maintain aspect ratio and fill shortest screen dimension
    [ NSLayoutConstraint activateConstraints:@[
                                               [_memeView.widthAnchor constraintLessThanOrEqualToAnchor:self.view.heightAnchor multiplier:_memeAspectRatio],
                                               [_memeView.heightAnchor constraintLessThanOrEqualToAnchor:self.view.widthAnchor multiplier: (1 / _memeAspectRatio)],

                                               [_memeView.widthAnchor constraintLessThanOrEqualToAnchor:self.view.widthAnchor],
                                               [_memeView.heightAnchor constraintLessThanOrEqualToAnchor:self.view.heightAnchor],

                                               [_memeView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
                                               [_memeView.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor]
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
