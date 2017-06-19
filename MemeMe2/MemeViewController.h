//
//  ViewController.h
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MemeView;

@interface MemeViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate,  UIImagePickerControllerDelegate>

{
    __weak IBOutlet UIBarButtonItem *navBarButtonR;
}

@property (nonatomic) MemeView * currentMeme;

- (void) showImagePicker;


@end

