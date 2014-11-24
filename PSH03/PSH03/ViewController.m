//
//  ViewController.m
//  PSH03
//
//  Created by Ivan on 11/23/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
@property (nonatomic) BOOL userIsInTheEnteringNumber;
@property (nonatomic,strong)  CalculatorBrain *brain;//从头文件中引入

@end

@implementation ViewController
@synthesize label;
@synthesize userIsInTheEnteringNumber= _userIsInTheEnteringNumber;
@synthesize brain = _brain;
-(CalculatorBrain *)brain{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}
-(IBAction)digitChanged:(UIButton *)sender{
    //将textField的内容设置给label
    NSString *digit = [sender currentTitle];
    NSLog(@"pressed at %@",digit);
//        label.text = digit;
    if (self.userIsInTheEnteringNumber) {
        self.label.text = [self.label.text stringByAppendingString:digit];

    }else{
        self.label.text = digit;
    }

}
-(IBAction)enterPressed:(UIButton *)sender{//调用pushOperand方法
    //按下确认键
    [self.brain pushOperand:[self.label.text doubleValue]];
    self.userIsInTheEnteringNumber = NO;//不再是输入数字状态
    
    
}
-(IBAction)operationPressed:(UIButton *)sender{
    if (self.userIsInTheEnteringNumber) {//自动调用
        [self enterPressed:(UIButton *)sender];
    }
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    self.label.text = resultString;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
