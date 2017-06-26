//
//  NSAttributedString+MemeTextAttributes.m
//  MemeMe2
//
//  Created by Ashley Arthur on 26/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import "NSAttributedString+MemeTextAttributes.h"
#import <UIKit/UIKit.h>

@implementation NSAttributedString (MemeTextAttributes)

+ (NSDictionary<NSString *,id> *)memeTextStyling{
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc]init] ;
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    
    NSDictionary * style = @{
                             NSStrokeColorAttributeName: [UIColor blackColor],
                             NSForegroundColorAttributeName: [UIColor whiteColor],
                             NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:40.0],
                             NSStrokeWidthAttributeName: [NSNumber numberWithFloat:-4.0],
                             NSParagraphStyleAttributeName: paragraphStyle,
                             };
    
    return style;
}

@end
