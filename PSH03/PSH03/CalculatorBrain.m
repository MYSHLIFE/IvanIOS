//
//  CalculatorBrain.m
//  PSH03
//
//  Created by Ivan on 11/24/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//
//新建cocoa touch class文件；
//声明一个 NSMutableArray 数组，push & push 数据
#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic,strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;
- (NSMutableArray *)operandStack{//声明堆栈

    if (_operandStack == nil) {
        _operandStack=[[NSMutableArray alloc] init];

    }
    return _operandStack;
}
-(void)setOperandStack:(NSMutableArray *)operandStack{
    _operandStack =operandStack;
}
-(void)pushOperand:(double)operand{//推入堆栈
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}
-(double)popOperand{// 弹出堆栈
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) {
        [self.operandStack removeLastObject];
    }
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *)operation{//实例方法－计算器
    double result = 0;
    if ([operation isEqualToString:@"+"]) {
        result =[self popOperand] + [self popOperand];
    }else if([@"*" isEqualToString:operation]){
        result =[self popOperand] * [self popOperand];
    }else if([@"/" isEqualToString:operation]){
        result =[self popOperand] / [self popOperand];
    }else if([@"-" isEqualToString:operation]){
        result =[self popOperand] - [self popOperand];
    }
    [self pushOperand:result];
    return result;
}

@end
