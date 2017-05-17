//
//  KSKeyboardButton.m
//  KSTextField
//
//  Created by He yang on 2017/5/17.
//  Copyright © 2017年 贺杨. All rights reserved.
//

#import "KSKeyboardButton.h"

@implementation KSKeyboardButton

- (instancetype)init {
    if (self = [super init]) {
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return self;
}

@end
