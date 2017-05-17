//
//  KSKeyboard.m
//  KSUIKit
//
//  Created by 贺杨 on 2017/3/18.
//  Copyright © 2017年 guoding. All rights reserved.
//

#import "KSKeyboard.h"
#import "UIView+Utility.h"
#define KEYBOARDHEIGHT 224
#define VERTICALVIEWCOUNT 4
#define HORIZONVIEWCOUNT 3
@interface KSKeyboard ()<UITextFieldDelegate>
@property (nonatomic, strong)UIView *topContainerView;
@property (nonatomic, strong)UIView *keyboardContainerView;
@property (nonatomic, strong)UIView *numberContainerView;
@property (nonatomic, strong)UIView *verticalContainerView;
@property (nonatomic, strong)UIView *horizonContainerView;
@property (nonatomic, copy)NSMutableString *text;
@property (nonatomic, strong)NSMutableArray *verticalItems;
@property (nonatomic, strong)NSMutableArray *horizonItems;
@end

@implementation KSKeyboard {
    CGFloat _buttonWidth;
    CGFloat _buttonHeight;
}

#pragma mark - LifeCyle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
        _buttonWidth = [UIScreen mainScreen].bounds.size.width / 4;
        _buttonHeight = 56;
        _text = @"".mutableCopy;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%@-释放了",self.class);
}

#pragma mark - Intial Methods
- (void)initSubviews {
    _topContainerView = [[UIView alloc] init];
    _topContainerView.backgroundColor = [UIColor blueColor];
    [self addSubview:_topContainerView];
    
    _keyboardContainerView = [[UIView alloc] init];
    [self addSubview:_keyboardContainerView];
    
    _numberContainerView = [[UIView alloc] init];
    [_keyboardContainerView addSubview:_numberContainerView];
    
    _verticalContainerView = [[UIView alloc] init];
    _verticalContainerView.backgroundColor = [UIColor greenColor];
    [_keyboardContainerView addSubview:_verticalContainerView];
     
    _horizonContainerView = [[UIView alloc] init];
    [_keyboardContainerView addSubview:_horizonContainerView];
    
    for (int i = 1; i < 10; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        [button addTarget:self action:@selector(keyboardButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [_numberContainerView addSubview:button];
    }
    
    for (int i = 0; i < self.verticalItems.count ; i ++ ) {
        NSMutableDictionary *dic = self.verticalItems[i];
        NSString *text = dic[@"text"];
        UIImage *image = dic[@"image"];
        NSNumber *tag = dic[@"tag"];
        UIButton *button = [[UIButton alloc] init];
        button.tag = tag.integerValue;
        [button addTarget:self action:@selector(keyboardButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        if (image) {
            button.imageView.contentMode = UIViewContentModeRedraw;
            [button setBackgroundImage:image forState:UIControlStateNormal];
        }else  {
            [button setTitle:text ? : @"" forState:UIControlStateNormal];
        }
        [_verticalContainerView addSubview:button];
    }
    
    for (int i = 0; i < self.horizonItems.count; i++) {
        NSMutableDictionary *dic = self.horizonItems[i];
        NSString *text = dic[@"text"];
        UIImage *image = dic[@"image"];
        NSNumber *tag = dic[@"tag"];
        UIButton *button = [[UIButton alloc] init];
        button.tag = tag.integerValue;
        [button addTarget:self action:@selector(keyboardButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        if (image) {
            button.imageView.contentMode = UIViewContentModeCenter;
            [button setImage:image forState:UIControlStateNormal];
        }else  {
            [button setTitle:text ? : @"" forState:UIControlStateNormal];
        }
        [_horizonContainerView addSubview:button];
    }
}

#pragma mark - Target Methods
- (void)keyboardButtonClicked:(UIButton *)sender {
    NSInteger tag = sender.tag;
    if (tag <= 9 || tag == 11) {
        [_text appendString:sender.titleLabel.text];
        self.textField.text = _text;
        if (_delegate && [_delegate respondsToSelector:@selector(textDidChange:)]) {
            [_delegate textDidChange:_text];
        }
        if (self.textChangeBlock) {
            self.textChangeBlock(_text);
        }
    }else if (tag == 10){
        if (_delegate && [_delegate respondsToSelector:@selector(textDidFinishEditing:)]) {
            [_delegate textDidFinishEditing:_text];
        }
    }else if (tag == 12) {
        if (_text.length>=1) {
            [_text replaceCharactersInRange:NSMakeRange(_text.length - 1, 1) withString:@""];
        }
        if (_delegate && [_delegate respondsToSelector:@selector(textDidChange:)]) {
            [_delegate textDidChange:_text];
        }
    }else if (tag == 13) {
        [self endEditing:YES];
    }
}

#pragma mark - Public Methods
- (void)show {
    [_textField becomeFirstResponder];
}

- (void)setTextField:(UITextField *)textField {
    _textField = textField;
    _text = textField.text.mutableCopy;
}

#pragma mark - Private Method
- (void)layoutSubviews {
    _topContainerView.top = 0;
    _topContainerView.left = 0;
    _topContainerView.height = self.height - KEYBOARDHEIGHT;
    _topContainerView.width = self.width;
    
    _keyboardContainerView.top = _topContainerView.bottom;
    _keyboardContainerView.left = 0;
    _keyboardContainerView.height = KEYBOARDHEIGHT;
    _keyboardContainerView.width = self.width;
    
    _numberContainerView.width = _keyboardContainerView.width * 0.75;
    _numberContainerView.height = _buttonHeight * 3;
    _numberContainerView.top = 0;
    _numberContainerView.left = 0;
    
    _verticalContainerView.left = _numberContainerView.right;
    _verticalContainerView.top = 0;
    _verticalContainerView.height = _buttonHeight * self.verticalItems.count;
    _verticalContainerView.width = _buttonWidth;
    
    _horizonContainerView.top = _numberContainerView.bottom;
    _horizonContainerView.left = 0;
    _horizonContainerView.height = _buttonHeight;
    _horizonContainerView.width = _buttonWidth * self.horizonItems.count;
    
    for (int i = 1; i < 10; i++) {
        UIButton *button = [_numberContainerView viewWithTag:i];
        if (button) {
            int column = i % 3 == 0 ? 2 : i % 3 - 1;
            int row = floor( i / 3);
            if (i % 3 == 0) {
                row--;
            }
            button.frame = CGRectMake(column * _buttonWidth, row * _buttonHeight, _buttonWidth, _buttonHeight);
        }
    }
    
    for (int i = 10; i < 10 + self.verticalItems.count; i ++) {
        UIButton *button = [_verticalContainerView viewWithTag:i];
        if (button) {
            CGFloat x = 0;
            CGFloat y = i-10;
            button.frame = CGRectMake(x, y * _buttonHeight, _buttonWidth, _buttonHeight);
        }
    }
    
    for (int i = (int)(10 + self.verticalItems.count); i < 10 + self.verticalItems.count + self.horizonItems.count; i++) {
        UIButton *button = [_horizonContainerView viewWithTag:i];
        if (button) {
            CGFloat x = i - (10 + self.verticalItems.count);
            CGFloat y = 0;
            button.frame = CGRectMake(x * _buttonWidth, y, _buttonWidth, _buttonHeight);
        }
    }
    [super layoutSubviews];
}

#pragma mark - Setter&Getter
- (NSMutableArray *)verticalItems {
    if (!_verticalItems) {
        _verticalItems = [NSMutableArray array];
        //tag 必须保证10~13
        NSMutableDictionary *item = @{}.mutableCopy;
        item[@"image"] = [UIImage imageNamed:@"loading"];
        item[@"tag"] = @10;
        [_verticalItems addObject:item];
        
        item = @{}.mutableCopy;
        item[@"text"] = @"+100";
        item[@"tag"] = @11;
        [_verticalItems addObject:item];
        
        item = @{}.mutableCopy;
        item[@"text"] = @"-100";
        item[@"tag"] = @12;
        [_verticalItems addObject:item];
        
        item = @{}.mutableCopy;
        item[@"text"] = @"清空";
        item[@"tag"] = @13;
        [_verticalItems addObject:item];
    }
    return _verticalItems;
}

- (NSMutableArray *)horizonItems {
    if (!_horizonItems) {
        _horizonItems = [NSMutableArray array];
        //tag 必须保证14~16
        NSMutableDictionary *item = @{}.mutableCopy;
        item[@"text"] = @".";
        item[@"tag"] = @14;
        [_horizonItems addObject:item];
        
        item = @{}.mutableCopy;
        item[@"text"] = @"0";
        item[@"tag"] = @15;
        [_verticalItems addObject:item];
        
        item = @{}.mutableCopy;
        item[@"text"] = @"00";
        item[@"tag"] = @16;
        [_verticalItems addObject:item];
    }
    return _horizonItems;
}

#pragma mark - External Delegate

@end
