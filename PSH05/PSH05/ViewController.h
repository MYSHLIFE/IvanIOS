//
//  ViewController.h
//  PSH05
//
//  Created by Ivan on 12/1/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface ViewController : UIViewController
-(void)updateScore:(NSInteger)score;
-(void)endGame:(BOOL)won;

@end

