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



@end

@implementation MemeViewController

#pragma mark - LIFE CYCLE

- (void)viewDidLoad {
    [super viewDidLoad];
    
    #pragma mark - MEME VIEW
    
    self.currentMeme = [[MemeView alloc] init];
    self.currentMeme.translatesAutoresizingMaskIntoConstraints = false ;
    [self.view addSubview:self.currentMeme];
    
    [ NSLayoutConstraint activateConstraints:@[
                                               [self.currentMeme.leftAnchor constraintEqualToAnchor: self.view.layoutMarginsGuide.leftAnchor],
                                               [self.currentMeme.rightAnchor constraintEqualToAnchor: self.view.layoutMarginsGuide.rightAnchor],
                                               [self.currentMeme.topAnchor constraintEqualToAnchor: self.topLayoutGuide.topAnchor],
                                               [self.currentMeme.bottomAnchor constraintEqualToAnchor: self.bottomLayoutGuide.bottomAnchor]
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
