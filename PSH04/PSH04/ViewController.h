//
//  ViewController.h
//  PSH04
//
//  Created by Ivan on 11/25/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Account;
@interface ViewController : UIViewController


@end

@interface Person : NSObject<NSCoding>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;
@property (nonatomic,assign) float height;
@property (nonatomic,assign) NSDate *birthday;

//@property (nonatomic,copy) NSString *name;
@property (nonatomic,retain) Account *account;

-(Person *)initWithName:(NSString *)name;

+(Person *)personWithName:(NSString *)name;

-(void)showMessage:(NSString *)infomation;

//自己实现对象比较方法
-(NSComparisonResult)comparePerson:(Person *)person;
@end