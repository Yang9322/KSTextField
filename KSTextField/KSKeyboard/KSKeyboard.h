//
//  KSKeyboard.h
//  KSUIKit
//
//  Created by 贺杨 on 2017/3/18.
//  Copyright © 2017年 guoding. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TextDidChangeBlock)(NSString *text);
typedef void(^TextFieldDidFinishEditingBlock)(NSString *text);


@protocol KSKeyboardProtocol <NSObject>

@optional
- (void)textDidChange:(NSString *)text;

- (void)textDidFinishEditing:(NSString *)text;

@end

@interface KSKeyboard : UIView

@property (nonatomic, weak)id <KSKeyboardProtocol>delegate;

@property (nonatomic, weak)UITextField *textField;

@property (nonatomic, copy) TextDidChangeBlock textChangeBlock;

@property (nonatomic, copy) TextFieldDidFinishEditingBlock endEditingBlock;

- (void)show;

@end
