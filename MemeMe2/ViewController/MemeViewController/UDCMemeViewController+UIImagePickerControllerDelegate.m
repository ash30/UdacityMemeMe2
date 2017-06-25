//
//  MemeViewController+UIImagePickerControllerDelegate.m
//  MemeMe2
//
//  Created by Ashley Arthur on 19/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UDCMemeViewController.h"
#import "UDCMemeView.h"
#import "UDCMemeDataSource.h"
#import "UDCMutableMeme.h"

@implementation UDCMemeViewController (UIImagePickerControllerDelegate)

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    
    if (image && self.dataSource && self.currentMemeId) {
        
        // Update Model and View
        [self.dataSource editExistingMemeWithID:self.currentMemeId usingBlock:^(UDCMutableMeme * meme) {
            meme.image = image;
            self.memeView.memeImage = meme.image;

        }];
        
        self.memeView.hidden = false;
        
    }
    [self dismissViewControllerAnimated:true completion:nil];

    
}

@end
