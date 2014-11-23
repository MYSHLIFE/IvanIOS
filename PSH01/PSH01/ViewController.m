//
//  ViewController.m
//  PSH01
//
//  Created by Ivan on 11/22/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/*
            
- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"viewDidLoad");
    NSLog(@"hello,world;");
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 450, 400)];
    label.text=@"Hello World!";
    [self.view addSubview:label];
    NSLog(@"viewDidLoad");
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 550, 500)];
    label2.text=@"Where are you from?";
    [self.view addSubview:label2];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@synthesize label1;
@synthesize textField1;
//-(IBAction)do:(id)sender{
//    //将textField的内容设置给label
//    label1.text = textField1.text;
//}

//textfield change action
-(IBAction)textFieldDidChanges:(id)sender{
    NSLog(@"ksdljkl");
    label1.text = textField1.text;
}
//DELETE button action
-(IBAction)delete:(id)sender{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"确定要删除该服务器？"
                                  delegate:self //actionSheet的代理，按钮被按下时收到通知，然后回调协议中的相关方法
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                  otherButtonTitles:nil];
    //展示actionSheet
    [actionSheet showInView:self.view];
}
//
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"didDismissWithButtonIndex");
    UIAlertView *alert = nil;
    if(buttonIndex == [actionSheet destructiveButtonIndex]){//确定
        //NSLog(@"确定");
        alert = [[UIAlertView alloc]
                 initWithTitle:@"结果"
                 message:@"删除完毕"
                 delegate:self
                 cancelButtonTitle:@"确定"
                 otherButtonTitles:nil];
        [alert show];
    }else if(buttonIndex == [actionSheet cancelButtonIndex]){//取消
        NSLog(@"取消");
    }
}
//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//    label1 = nil;
//    textField1 = nil;
//    //创建工程时选择了arc，所以不能手动执行release
//    //[label release];
//    //[textField release];
//    // Release any retained subviews of the main view.
//}
*/
//******************* test 4 ****************//
/*
@synthesize slider;
@synthesize sliderValueLabel;

@synthesize xLabel;
@synthesize initialFontSize;

-(void)loadView{
    UIView *myView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    [myView setBackgroundColor:[UIColor blueColor]];
    self.view = myView;
    //初始化视图
    [self initViews];
}
-(void)initViews{
    //初始化slider
    //sliderValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 50, 40)];
    //显示slider值的label
    sliderValueLabel = [[UILabel alloc]init];
//    sliderValueLabel = [UILabel new];

    CGRect frame = sliderValueLabel.frame;
    frame.origin.x = 20;
    frame.origin.y = 30;
    frame.size.width = 50;
    frame.size.height = 40;
    sliderValueLabel.frame = frame;

    sliderValueLabel.backgroundColor = [UIColor grayColor];
//    sliderValueLabel.textAlignment = UITextAlignmentCenter;
    sliderValueLabel.text = @"0";

    //加入到view中
    [self.view addSubview:sliderValueLabel];
    
    //slider，通过sliderValueLabel的相对位置定义frame
    frame.origin.x = CGRectGetMaxX(frame)+10;
    frame.origin.y = CGRectGetMinY(frame);
    frame.size.width = 200;
    frame.size.height = 40;
    slider = [[UISlider alloc]initWithFrame:frame];
    slider.minimumValue = 0;//最小值
    slider.maximumValue = 25;//最大值
    slider.value = 0;//执行初始值
    //设置响应事件(此操作同：使用xib中时将事件与操作IBAction进行关联)
    [slider addTarget:self //事件委托对象
               action:@selector(sliderValueChanged) //处理事件的方法
     forControlEvents:UIControlEventValueChanged//具体事件
     ];
    //加入到view中
    [self.view addSubview:slider];
    
    //X label
    frame.origin.x = 0;
    frame.origin.y = CGRectGetMaxY(sliderValueLabel.frame)+10;
    frame.size.width = self.view.frame.size.width;
    frame.size.height = self.view.frame.size.height-frame.origin.y;
    xLabel = [[UILabel alloc]initWithFrame:frame];
    
    xLabel.backgroundColor = [UIColor yellowColor];
    xLabel.textAlignment = UITextAlignmentCenter;
    xLabel.text = @"👄";
    initialFontSize = xLabel.font.pointSize;
    //NSLog(@"initialFontSize=%.2f",initialFontSize);
    //加入到View中
    [self.view addSubview:xLabel];
}

//slider值改变时进行处理
-(void)sliderValueChanged{
    //NSLog(@"sliderValueChanged");
    //更新sliderValueLabel的值
    sliderValueLabel.text = [[NSString alloc]initWithFormat:@"%.0f",slider.value];
    
    //缩放xLabel的内容
    CGFloat newFontSize = initialFontSize*(slider.value+1);
    //NSLog(@"newFontSize=%.2f",newFontSize);
    xLabel.font = [xLabel.font fontWithSize:newFontSize];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    slider = nil;
    sliderValueLabel = nil;
    xLabel = nil;
    // Release any retained subviews of the main view.
}
*/
//-(void)dealloc{
//    [super dealloc];
//    [sliderValueLabel release];
//    [slider release];
//    [xLabel release];
//}

/************** test 5 picker view ***********/
//test 5 picker 5
/*
@synthesize picker;
@synthesize appleDevices;
@synthesize deviceCategory;
@synthesize deviceName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array1 = [NSArray arrayWithObjects:@"iPhone",@"iPad",@"iPod",nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"Mac",@"iMac",@"Mac Mini",@"Mac Pro",nil];
    NSDictionary  *dictionary= [NSDictionary dictionaryWithObjectsAndKeys:array1,@"Mobile",array2,@"Computers",nil];//注意用nil结束
    appleDevices = [[NSDictionary alloc]initWithDictionary:dictionary copyItems:YES];
    
    NSArray *components = [self.appleDevices allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    self.deviceCategory = sorted;
    
    NSString *selectedCategory = [self.deviceCategory objectAtIndex:0];
    self.deviceName = [self.appleDevices objectForKey:selectedCategory];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    picker = nil;
    appleDevices = nil;
    deviceCategory = nil;
    deviceName = nil;
    // Release any retained subviews of the main view.
}

//-(void)dealloc{
//    [picker release];
//    [appleDevices release];
//    [deviceCategory release];
//    [deviceName release];
//}


-(IBAction)buttonPressed:(id)sender{
    NSString *selectedCategory = [self.deviceCategory objectAtIndex:[self.picker selectedRowInComponent:kDeviceCategory]];
    NSString *selectedDevice = [self.deviceName objectAtIndex:[self.picker selectedRowInComponent:kDeviceName]];
    //NSLog(@"%@-%@",selectedCategory,selectedDevice);
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"%@:%@",selectedCategory,selectedDevice]  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}



#pragma mark Picker View  DataSource methods
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == kDeviceCategory){
        return [self.deviceCategory count];
    }else{
        return [self.deviceName count];
    }
}

#pragma mark Picker View  Delegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == kDeviceCategory){
        return [self.deviceCategory objectAtIndex:row];
    }else{
        return [self.deviceName objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == kDeviceCategory){
        NSString *selectedCategory = [self.deviceCategory objectAtIndex:row];
        NSArray *array = [self.appleDevices objectForKey:selectedCategory];
        self.deviceName = array;
        
        [self.picker selectRow:0 inComponent:kDeviceName animated:YES];
        [self.picker reloadComponent:kDeviceName];
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
*/
//@end
/************** test 6 table view ***********/
/*
@synthesize apps;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //加载数据
    [self loadDatas];
}

//模拟加载数据
-(void)loadDatas{
    apps = [[NSMutableArray alloc]init];
    for(int i=0;i<8;i++){
        [apps insertObject:[NSString stringWithFormat:@"App-%d",(i+1)] atIndex:i];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    apps = nil;
    // Release any retained subviews of the main view.
}

//-(void)dealloc{
//    [super dealloc];
//    [apps release];
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark table view datasource methods
//可选实现的方法，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 2;
}

//必须实现的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [apps count];
}

//必须实现的方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    NSString *myTableViewCellIdentifier = @"myTableViewCellIdentifier";
    UITableViewCell *cell = [[UITableView alloc]dequeueReusableCellWithIdentifier:myTableViewCellIdentifier];//备注1
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myTableViewCellIdentifier]; //备注2
    }
    NSString *imageName = [NSString stringWithFormat:@"%ld",[indexPath row]+1];
    //cell.image = [UIImage imageNamed:imageName]; //这种用法已经废弃
    cell.imageView.image = [UIImage imageNamed:imageName];
    cell.textLabel.text = [apps objectAtIndex:[indexPath row]];
//    cell.textLabel.textAlignment = UITextAlignmentLeft;
    cell.textLabel.font = [cell.textLabel.font fontWithSize:30];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//可选实现的方法
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Header";
}

//可选实现的方法
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"Footer";
}

#pragma mark table view data delegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
*/
@end
