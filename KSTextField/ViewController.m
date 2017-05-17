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
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.isCustomAppearance = YES;
    self.textField.textChangeBlock = ^(NSString *text) {
        NSLog(@"\nbegin---\n%@\n---end",text );
    };
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
