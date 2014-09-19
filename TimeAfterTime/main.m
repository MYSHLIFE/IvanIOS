//
//  main.m
//  TimeAfterTime
//
//  Created by Ivan on 9/19/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSDate *now = [NSDate date];
        NSLog(@"the new date lives ate %p",now);
        NSLog(@"the new date lives ate %@",now);
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970",seconds);
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 1000000 seconds it will be %@",later);

        NSLog(@"Hello, World!");
    }
    return 0;
}
