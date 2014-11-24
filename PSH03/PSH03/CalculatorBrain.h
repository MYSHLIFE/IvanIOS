//
//  CalculatorBrain.h
//  PSH03
//
//  Created by Ivan on 11/24/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;
@end
