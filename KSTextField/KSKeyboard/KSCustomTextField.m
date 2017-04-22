//
//  KSTextField.m
//  KSUIKit
//
//  Created by 贺杨 on 2017/3/18.
//  Copyright © 2017年 guoding. All rights reserved.
//

#import "KSCustomTextField.h"
#import "KSKeyboard.h"
@interface KSCustomTextField ()<KSKeyboardProtocol>
@property (nonatomic, strong)KSKeyboard *keyboard;
@end

@implementation KSCustomTextField

#pragma mark - LifeCyle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _keyboard = [[KSKeyboard alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 224)];
        _keyboard.delegate = self;
        self.inputView = _keyboard;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _keyboard = [[KSKeyboard alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 224)];
        _keyboard.delegate = self;
        self.inputView = _keyboard;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%@-释放了",self.class);
}

#pragma mark - Intial Methods

#pragma mark - Target Methods

#pragma mark - Private Method

#pragma mark - Setter&Getter
- (void)setOptions:(CustomTextFileOptions)options {
    _options = options;
    if (options & CustomTextFileOptionsDecaimalPoint) {
        _keyboard.shouldHaveDecimalPointButton = YES;
    }
    if (options & CustomTextFileOptionsDone) {
        _keyboard.shouldHaveDoneButton = YES;
    }
}

#pragma mark - External Delegate

- (void)textDidChange:(NSString *)text {
    self.text = text;
    if (_textFieldDelegate && [_textFieldDelegate respondsToSelector:@selector(textFieldDidChanged:)]) {
        [_textFieldDelegate textFieldDidChanged:self];
    }
}

-(void)textDidFinishEditing:(NSString *)text {
    NSLog(@"\nbegin---\n%@\n---end",text);
    [self resignFirstResponder];
}

@end
