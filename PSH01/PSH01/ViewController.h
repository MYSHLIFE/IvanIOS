//
//  ViewController.h
//  PSH01
//
//  Created by Ivan on 11/22/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kDeviceCategory 0
#define kDeviceName 1
//
@interface ViewController : UIViewController
//
//
//@end
//@interface ViewController : UIViewController<UIActionSheetDelegate>

//@interface ViewController : UIViewController
//添加如下代码
/*
@property(nonatomic,retain)IBOutlet UILabel *label1; //label指向xib文件中的UILabel组件
@property(nonatomic,retain)IBOutlet UITextField *textField1;//textField指向xib文件中的UITextField组件
//-(IBAction)do:(id)sender;//方法do与xib文件中的UIButton的点击事件关联起来
-(IBAction)textFieldDidChanges:(id)sender;
//-(IBAction)backgroudTap:(id)sender;

-(IBAction)delete:(id)sender;
*/
//test 4 --不使用设计器
//@property(nonatomic,retain)UILabel *sliderValueLabel;
//@property(nonatomic,retain)UISlider *slider;
//
//@property(nonatomic,retain)UILabel *xLabel;
//@property(assign,nonatomic)CGFloat initialFontSize;

//test 5 picker view
/*
@property(strong,nonatomic)IBOutlet UIPickerView *picker;
@property(nonatomic,retain)NSDictionary *appleDevices;
@property(nonatomic,retain)NSArray *deviceCategory;
@property(nonatomic,retain)NSArray *deviceName;

-(IBAction)buttonPressed:(id)sender;
 */

/* test 6 table view*/
//@property(nonatomic,retain)NSMutableArray *apps;
@end
