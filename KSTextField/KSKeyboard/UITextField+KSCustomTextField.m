//
//  UITextField+KSCustomTextField.m
//  KSTextField
//
//  Created by 贺杨 on 2017/5/17.
//  Copyright © 2017年 贺杨. All rights reserved.
//

#import "UITextField+KSCustomTextField.h"
#import <objc/runtime.h>
#import "KSKeyboard.h"
static char isCustomAppearanceToken;
static char keyboardToken;
static char endEdtingToken;
static char textChangeToken;

@implementation UITextField (KSCustomTextField)

- (void)setIsCustomAppearance:(BOOL)isCustomAppearance {
    objc_setAssociatedObject(self, &isCustomAppearanceToken, @(isCustomAppearance), OBJC_ASSOCIATION_ASSIGN);
    if (self.isCustomAppearance) {
        self.keyboard = [[KSKeyboard alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400)];
        self.keyboard.textField = self;
        self.inputView = self.keyboard;
    }
}

- (BOOL)isCustomAppearance {
    return [objc_getAssociatedObject(self, &isCustomAppearanceToken) boolValue];
}

- (void)setKeyboard:(KSKeyboard *)keyboard {
    objc_setAssociatedObject(self, &keyboardToken,keyboard, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (KSKeyboard *)keyboard {
    return objc_getAssociatedObject(self, &keyboardToken);
}

- (void)setEndEditingBlock:(TextFieldDidFinishEditingBlock)endEditingBlock {
    objc_setAssociatedObject(self, &endEdtingToken,endEditingBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.keyboard.endEditingBlock = endEditingBlock;
}

- (TextFieldDidFinishEditingBlock)endEditingBlock {
    return objc_getAssociatedObject(self, &endEdtingToken);
}

- (void)setTextChangeBlock:(TextDidChangeBlock)textChangeBlock {
    objc_setAssociatedObject(self, &textChangeToken, textChangeBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.keyboard.textChangeBlock = textChangeBlock;
}

- (TextDidChangeBlock)textChangeBlock {
    return  objc_getAssociatedObject(self, &textChangeToken);
}

@end
