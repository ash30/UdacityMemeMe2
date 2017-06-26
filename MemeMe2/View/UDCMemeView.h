//
//  MemeView.h
//  MemeMe2
//
//  Created by Ashley Arthur on 18/06/2017.
//  Copyright © 2017 AshArthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UDCMeme;

@interface UDCMemeView : UIView

@property (nullable, nonatomic) UIImage * memeImage;
@property (nullable, nonatomic) id<UITextViewDelegate> textDelegate;

- (void) displayMeme: (nonnull UDCMeme * ) meme;


@end
