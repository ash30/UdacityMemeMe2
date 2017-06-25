//
//  ViewController.m
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//
#import "UDCMemeDataSource.h"
#import "UDCMeme.h"
#import "UDCMemeViewController.h"
#import "UDCMemeView.h"
#import "UDCImagePlaceHolder.h"


#pragma mark - CONSTANTS

static const CGFloat kContentViewMargin = 16;


#pragma mark - PRIVATE

@interface UDCMemeViewController ()

@property (readwrite) float memeAspectRatio;
@property (nonatomic) UIView * contentView;
@property (nonatomic) UIView * placeholderView;
@property (nonatomic) UITapGestureRecognizer * createGesture;
@property (nonatomic) UITapGestureRecognizer * altCreateGesture;



@end


#pragma mark - VIEW CONTROLLER

@implementation UDCMemeViewController


#pragma mark - LIFE CYCLE

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _memeAspectRatio = 0.9;

    // CONTENT VIEW
    self.contentView = [[UIView alloc] init];
    _contentView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:_contentView];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [_contentView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor constant:kContentViewMargin],
                                              [_contentView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor constant:-kContentViewMargin],
                                              [_contentView.topAnchor constraintEqualToAnchor: self.view.layoutMarginsGuide.topAnchor constant:kContentViewMargin],
                                              [_contentView.bottomAnchor constraintEqualToAnchor: self.view.layoutMarginsGuide.bottomAnchor constant:-kContentViewMargin]
                                              ]];
    
    // PLACEHOLDER VIEW
    
    self.placeholderView = [[UDCImagePlaceHolder alloc] init];
    _placeholderView.translatesAutoresizingMaskIntoConstraints = false;
    [_contentView addSubview:_placeholderView];
    
    [ NSLayoutConstraint activateConstraints:@[
                                               [_placeholderView.widthAnchor constraintLessThanOrEqualToAnchor: _contentView.heightAnchor multiplier:_memeAspectRatio],
                                               [_placeholderView.heightAnchor constraintLessThanOrEqualToAnchor: _contentView.widthAnchor multiplier: (1 / _memeAspectRatio)],
                                               
                                               [_placeholderView.widthAnchor constraintLessThanOrEqualToAnchor: _contentView.widthAnchor],
                                               [_placeholderView.heightAnchor constraintLessThanOrEqualToAnchor: _contentView.heightAnchor],
                                               
                                               [_placeholderView.centerXAnchor constraintEqualToAnchor: _contentView.centerXAnchor],
                                               [_placeholderView.centerYAnchor constraintEqualToAnchor: _contentView.centerYAnchor]
                                               ]];
    
    // Without any instrinsic dimensions, we must set a low priority dimension constraint for view
    NSLayoutConstraint * minWidth = [_placeholderView.widthAnchor constraintEqualToAnchor:_contentView.widthAnchor];
    NSLayoutConstraint * minHeight = [_placeholderView.heightAnchor constraintEqualToAnchor:_contentView.heightAnchor];
    minWidth.priority = 100;
    minHeight.priority = 100;
    [ NSLayoutConstraint activateConstraints:@[minWidth, minHeight]];


    // MEME VIEW
    
    self.memeView = [[UDCMemeView alloc] init];
    _memeView.translatesAutoresizingMaskIntoConstraints = false;
    _memeView.hidden = true;
    _memeView.textDelegate = self;
    [_contentView addSubview:_memeView];
    
    // Maintain aspect ratio and fill shortest screen dimension
    [ NSLayoutConstraint activateConstraints:@[
                                               [_memeView.widthAnchor constraintLessThanOrEqualToAnchor: _contentView.heightAnchor multiplier:_memeAspectRatio],
                                               [_memeView.heightAnchor constraintLessThanOrEqualToAnchor: _contentView.widthAnchor multiplier: (1 / _memeAspectRatio)],

                                               [_memeView.widthAnchor constraintLessThanOrEqualToAnchor: _contentView.widthAnchor],
                                               [_memeView.heightAnchor constraintLessThanOrEqualToAnchor: _contentView.heightAnchor],

                                               [_memeView.centerXAnchor constraintEqualToAnchor: _contentView.centerXAnchor],
                                               [_memeView.centerYAnchor constraintEqualToAnchor: _contentView.centerYAnchor]
                                               ]];
    
    // GESTURES
    
    self.createGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImagePicker)];
    [_placeholderView addGestureRecognizer:_createGesture];

    self.altCreateGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImagePicker)];
    _altCreateGesture.numberOfTapsRequired = 2;
    [_memeView addGestureRecognizer:_altCreateGesture];
    
}

#pragma mark - PICKER

- (void) showImagePicker {
    UIImagePickerController * vc = [[ UIImagePickerController alloc ] init];
    if (vc) {
        vc.delegate = self;
        [self presentViewController:vc animated:true completion:nil];
    }
}

@end
