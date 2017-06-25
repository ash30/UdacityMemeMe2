//
//  ViewController.h
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MemeView;
@class MemeDataSource;

@interface MemeViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate,  UIImagePickerControllerDelegate>

// Model
@property (nonatomic) NSUUID * currentMemeId;
@property (nonatomic) MemeDataSource * dataSource;

// View Config
@property (readonly) float memeAspectRatio;

// Views
@property (nonatomic) MemeView * memeView;

- (void) showImagePicker;

@end

