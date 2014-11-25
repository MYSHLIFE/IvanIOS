//
//  ViewController.m
//  PSH04
//
//  Created by Ivan on 11/25/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


@implementation Person
//Method1   address:http://www.cnblogs.com/kenshincui/p/3885689.html;
#pragma mark 解码
-(id)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@"decode...");
    if (self=[super init]) {
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.age=[aDecoder decodeInt64ForKey:@"age"];
        self.height=[aDecoder decodeFloatForKey:@"heiht"];
        self.birthday=[aDecoder decodeObjectForKey:@"birthday"];
    }
    return self;
}

#pragma mark 编码
-(void)encodeWithCoder:(NSCoder *)aCoder{
    NSLog(@"encode...");
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt64:_age forKey:@"age" ];
    [aCoder encodeFloat:_height forKey:@"height"];
    [aCoder encodeObject:_birthday forKey:@"birthday"];
    
}

#pragma mark 重写描述
-(NSString *)description{
    NSDateFormatter *formater1=[[NSDateFormatter alloc]init];
    formater1.dateFormat=@"yyyy-MM-dd";
    return [NSString stringWithFormat:@"name=%@,age=%i,height=%.2f,birthday=%@",_name,_age,_height,[formater1 stringFromDate:_birthday]];
}
-(Person *)initWithName:(NSString *)name{
    if(self=[super init]){
        self.name=name;
    }
    return self;
}

+(Person *)personWithName:(NSString *)name{
    Person *person=[[Person alloc]initWithName:name];
    return person;
}

-(void)showMessage:(NSString *)infomation{
    NSLog(@"My name is %@,the infomation is \"%@\".",_name,infomation);
}

//自己实现对象比较方法
-(NSComparisonResult)comparePerson:(Person *)person{
    return [_name compare:person.name];
}
//
//-(NSString *)description{
//    return [NSString stringWithFormat:@"name=%@",_name];
//}

@end