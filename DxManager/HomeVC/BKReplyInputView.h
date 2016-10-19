//
//  BKReplyInputView.h
//  BKMobile
//
//  Created by Guibin on 15/5/7.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  消息输入框view 自动调整输入框高度
 */
@protocol InputDelegate <NSObject>

- (void)replyInputWithText:(NSString *)replyText appendTag:(NSInteger)inputTag;


@end

@interface BKReplyInputView : UIView<UITextViewDelegate>
{
    CGFloat topGap;
    CGFloat keyboardAnimationDuration;
    UIViewAnimationCurve keyboardAnimationCurve;
    int inputHeight;
    int inputHeightWithShadow;
    
}


@property (strong, nonatomic) UIButton* sendButton;
@property (strong, nonatomic) UITextView* textView;
@property (strong, nonatomic) UILabel* lblPlaceholder;
@property (strong, nonatomic) UIImageView* inputBackgroundView;
@property (strong, nonatomic) UITextField *textViewBackgroundView;
@property (assign, nonatomic) BOOL autoResizeOnKeyboardVisibilityChanged;
@property (readwrite, nonatomic) CGFloat keyboardHeight;
@property (assign, nonatomic) id<InputDelegate>delegate;
@property (assign, nonatomic) NSInteger replyTag;

- (NSString *)text;
- (void)setText:(NSString *)text;
- (void)setPlaceholder:(NSString *)text;
- (void)showCommentView;
- (void)disappear;


@end
