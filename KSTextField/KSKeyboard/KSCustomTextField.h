//
//  KSTextField.h
//  KSUIKit
//
//  Created by 贺杨 on 2017/3/18.
//  Copyright © 2017年 guoding. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, CustomTextFileOptions) {
    CustomTextFileOptionsDefault = 1 << 0,
    CustomTextFileOptionsDecaimalPoint = 1 << 1,
    CustomTextFileOptionsDone = 1 << 2,
};

@class KSCustomTextField;

@protocol KSCustomTextFieldProtocol <NSObject>

@optional

- (void)textFieldDidChanged:(KSCustomTextField *)textField;

@end

@interface KSCustomTextField : UITextField

@property (nonatomic, weak)id <KSCustomTextFieldProtocol>textFieldDelegate;

@property (nonatomic, assign)CustomTextFileOptions options;

@end
