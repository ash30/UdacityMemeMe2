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


@implementation UDCMemeViewController (textFieldDelegate)

- (void)textViewDidChange:(UITextView *)textView {
    // Small hack, call the setter so custom subclass with override can vertically align
    textView.text = textView.text;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    NSDictionary * const style = @{
                                   NSStrokeColorAttributeName: [UIColor blackColor],
                                   NSForegroundColorAttributeName: [UIColor whiteColor],
                                   NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:40.0],
                                   NSStrokeWidthAttributeName: [NSNumber numberWithFloat:-2.0]
                                   };
    textView.typingAttributes = style;
    textView.textAlignment = NSTextAlignmentCenter;

    return true;
}

@end
