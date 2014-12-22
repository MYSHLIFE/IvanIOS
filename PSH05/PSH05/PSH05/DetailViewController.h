//
//  DetailViewController.h
//  PSH05
//
//  Created by Ivan on 11/30/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

