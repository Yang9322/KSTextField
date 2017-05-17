//
//  UITextField+KSCustomTextField.h
//  KSTextField
//
//  Created by 贺杨 on 2017/5/17.
//  Copyright © 2017年 贺杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSKeyboard.h"

typedef void(^TextDidChangeBlock)(NSString *text);
typedef void(^TextFieldDidFinishEditingBlock)(NSString *text);
@interface UITextField (KSCustomTextField)

@property (nonatomic, assign) BOOL isCustomAppearance;

@property (nonatomic, strong) KSKeyboard *keyboard;

@property (nonatomic, copy) TextDidChangeBlock textChangeBlock;

@property (nonatomic, copy) TextFieldDidFinishEditingBlock endEditingBlock;

@end
