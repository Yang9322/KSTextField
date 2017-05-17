//
//  ViewController.m
//  KSTextField
//
//  Created by 贺杨 on 2017/4/21.
//  Copyright © 2017年 贺杨. All rights reserved.
//

#import "ViewController.h"
#import "KSCustomTextField.h"
#import "UITextField+KSCustomTextField.h"
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.isCustomAppearance = YES;
    self.textField.textChangeBlock = ^(NSString *text) {
        NSLog(@"\nbegin---textChange == %@\n---end",text );
    };
    self.textField.endEditingBlock = ^(NSString *text) {
        NSLog(@"\nbegin---textEndEditing == %@\n---end",text );
    };
    self.textField.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

// V
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

//V
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}


- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
