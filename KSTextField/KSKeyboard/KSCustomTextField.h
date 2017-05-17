//
//  KSTextField.h
//  KSUIKit
//
//  Created by 贺杨 on 2017/3/18.
//  Copyright © 2017年 guoding. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KSCustomTextField;
@protocol KSCustomTextFieldProtocol <NSObject>

@optional
- (void)textFieldDidChanged:(KSCustomTextField *)textField;

@end

@interface KSCustomTextField : UITextField

@property (nonatomic, weak)id <KSCustomTextFieldProtocol>textFieldDelegate;

@end
