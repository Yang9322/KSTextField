//
//  KSKeyboard.h
//  KSUIKit
//
//  Created by 贺杨 on 2017/3/18.
//  Copyright © 2017年 guoding. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KSKeyboardProtocol <NSObject>

@optional
- (void)textDidChange:(NSString *)text;

- (void)textDidFinishEditing:(NSString *)text;

@end

@interface KSKeyboard : UIView

@property (nonatomic, weak)id <KSKeyboardProtocol>delegate;

- (void)show;

@end
