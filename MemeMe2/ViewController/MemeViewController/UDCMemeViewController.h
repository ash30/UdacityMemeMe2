//
//  ViewController.h
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UDCMemeView;
@class UDCMemeDataSource;

@interface UDCMemeViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate,  UIImagePickerControllerDelegate>

// Model
@property (nonatomic) NSUUID * currentMemeId;
@property (nonatomic) UDCMemeDataSource * dataSource;

// View Config
@property (readonly) float memeAspectRatio;

// Views
@property (nonatomic) UDCMemeView * memeView;

- (void) showImagePicker;

@end

