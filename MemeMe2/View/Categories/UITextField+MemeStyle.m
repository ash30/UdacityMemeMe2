//
//  UITextField+UITextField_MemeStyle.m
//  MemeMe2
//
//  Created by Ashley Arthur on 22/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "UITextField+MemeStyle.h"

@implementation UITextField (UITextField_MemeStyle)

+ (void)styleMemeTextField:(UITextField *)textField {
    NSDictionary * const style = @{
                                   NSStrokeColorAttributeName: [UIColor blackColor],
                                   NSForegroundColorAttributeName: [UIColor whiteColor],
                                   NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:40.0],
                                   NSStrokeWidthAttributeName: [NSNumber numberWithFloat:-2.0]
                                   };
    textField.typingAttributes = style;
}


@end
