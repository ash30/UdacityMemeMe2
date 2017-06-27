//
//  MemeViewController+TextFieldDelegate.m
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UDCMemeViewController.h"
#import "UDCVerticalTextView.h"
#import "UDCMemeDataSource.h"
#import "UDCMutableMeme.h"
#import "NSAttributedString+MemeTextAttributes.h"
#import <objc/runtime.h>
#import <MemeMe2-Swift.h>

@implementation UDCMemeViewController (textFieldDelegate)

- (void)textViewDidChange:(UITextView *)textView {
    // Small hack, call the setter so custom subclass with override can vertically align
    textView.text = textView.text;
    
    [self.dataSource editExistingMemeWithID:self.currentMemeId usingBlock:^(UDCMutableMeme * meme) {
       
        // Update model data
        // FIXME: Formalise tags into names
        if (textView.tag == 0){
            meme.header = textView.text;
        }
        else{
            meme.footer = textView.text;
        }
        
    }];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    textView.typingAttributes = [NSAttributedString memeTextStyling ];
    return true;
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    KeyboardManager * delgate = objc_getAssociatedObject(self, UDCAssociatedKeyboardManagerKey);
    delgate.activeInputView = textView;
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    KeyboardManager * delgate = objc_getAssociatedObject(self, UDCAssociatedKeyboardManagerKey);
    delgate.activeInputView = nil;
}

@end
