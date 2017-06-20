//
//  MemeViewController+UIImagePickerControllerDelegate.m
//  MemeMe2
//
//  Created by Ashley Arthur on 19/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemeViewController.h"
#import "MemeView.h"

@implementation MemeViewController (UIImagePickerControllerDelegate)

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    
    if (image) {
        
        [self.memeView setMemeImage:image];
        [self dismissViewControllerAnimated:true completion:nil];
        
    }
    
}

@end
