//
//  ViewController.h
//  PSH03
//
//  Created by Ivan on 11/23/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic,retain)IBOutlet UILabel *label; //label指向xib文件中的UILabel组件

-(IBAction)digitChanged:(id)sender;//数字键
-(IBAction)enterPressed:(id)sender;// 确认键
-(IBAction)operationPressed:(id)sender;//操作符

@end

