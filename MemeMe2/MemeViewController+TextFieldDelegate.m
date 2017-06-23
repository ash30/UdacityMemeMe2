//
//  MemeViewController+TextFieldDelegate.m
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemeViewController.h"
#import "UITextField+MemeStyle.h"

@implementation MemeViewController (textFieldDelegate)

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [UITextField styleMemeTextField:textField];
    return true;
}

@end
