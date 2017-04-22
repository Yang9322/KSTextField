//
//  ViewController.m
//  KSTextField
//
//  Created by 贺杨 on 2017/4/21.
//  Copyright © 2017年 贺杨. All rights reserved.
//

#import "ViewController.h"
#import "KSCustomTextField.h"
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet KSCustomTextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChangeNotification) name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidEndEditingNotification) name:UITextFieldTextDidEndEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidBeginEditingNotification) name:UITextFieldTextDidBeginEditingNotification object:nil];

    _textField.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}


//V
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
//V
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
//V
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

//V
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

//V
- (void)textFieldTextDidEndEditingNotification {
    
}

//V
- (void)textFieldTextDidBeginEditingNotification {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    [self.view endEditing:YES];
    
}

@end
