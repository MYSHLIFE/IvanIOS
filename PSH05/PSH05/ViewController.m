//
//  ViewController.m
//  PSH05
//
//  Created by Ivan on 12/1/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import "ViewController.h"
#import "Scene.h"
#import "GameManager.h"
#import "ScoreView.h"
#import "Overlay.h"
#import "GridView.h"

@interface ViewController (){
    IBOutlet UIButton *_restartButton;//restart button
    IBOutlet UIButton *_settingsButton;// settings button
    IBOutlet UILabel *_targetScore;// target score
    IBOutlet UILabel *_subtitle;
    
}

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
