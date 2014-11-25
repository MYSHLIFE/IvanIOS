//
//  main.m
//  PSH04
//
//  Created by Ivan on 11/25/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"
//Method 2
//xml属性
void test1(){
    //数组
    NSString *path=@"/Users/Ivan/Documents/Dev/IOS/MyIOS/array.plist";
    NSArray *array1=@[@"Kenshin",@"Kaoru",@"Rosa"];
    [array1 writeToFile:path atomically:YES];
    
    NSArray *array2=[NSArray arrayWithContentsOfFile:path];
    [array2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"bool value:  %lu",(unsigned long)idx);
        NSLog(@"array2[%lu]=%@",idx,obj);//lu 无符号长整型。
    }];
    /*结果：
     array1[0]=Kenshin
     array1[1]=Kaoru
     array1[2]=Rosa
     */
    
    
    //字典
    NSString *path2=@"/Users/Ivan/Documents/Dev/IOS/MyIOS/dic.plist";
    NSDictionary *dic1=@{@"name":@"Kenshin",@"age":@28,@"height":@172.5};
    [dic1 writeToFile:path2 atomically:YES];
    
    NSDictionary *dic2=[NSDictionary dictionaryWithContentsOfFile:path2];
    [dic2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"bool value:  %@",key);
        NSLog(@"dic2[%@]=%@",key,obj);
    }];
    /*结果：
     dic2[height]=172.5
     dic2[age]=28
     dic2[name]=Kenshin
     */
}
//Method 3
//文件操作
/*目录操作*/
void test8(){
    //文件管理器是专门用于文件管理的类
    NSFileManager *manager=[NSFileManager defaultManager];
    
    //获得当前程序所在目录(当然可以改变)
    NSString *currentPath=[manager currentDirectoryPath];
    NSLog(@"current path is :%@",currentPath);
    //结果：/Users/kenshincui/Library/Developer/Xcode/DerivedData/FoundationFramework-awxjohcpgsqcpsanqofqogwbqgbx/Build/Products/Debug
    
    //创建目录
    NSString *myPath=@"/Users/Ivan/Documents/Dev/IOS/MyIOS/TEST";
    BOOL result= [manager createDirectoryAtPath:myPath withIntermediateDirectories:YES attributes:nil error:nil];
    if(result==NO){
        NSLog(@"Couldn't create directory!");
    }
    
    //目录重命名，如果需要删除目录只要调用removeItemAtPath:<#(NSString *)#> error:<#(NSError **)#>
    NSError *error;
    NSString *newPath=@"/Users/Ivan/Documents/Dev/IOS/MyIOS/TEST1";
    if([manager moveItemAtPath:myPath toPath:newPath error:&error]==NO){
        NSLog(@"Rename directory failed!Error infomation is:%@",error);
    }
    
    //改变当前目录
    if([manager changeCurrentDirectoryPath:newPath]==NO){
        NSLog(@"Change current directory failed!");
    }
    NSLog(@"current path is :%@",[manager currentDirectoryPath]);
    //结果：current path is :/Users/kenshincui/Desktop/myNewDocument
    
    //遍历整个目录
    NSString *path;
    NSDirectoryEnumerator *directoryEnumerator= [manager enumeratorAtPath:newPath];
    while (path=[directoryEnumerator nextObject]) {
        NSLog(@"%@",path);
    }
    /*结果：
     documents
     est.txt
     */
    
    //或者这样遍历
    NSArray *paths= [manager contentsOfDirectoryAtPath:newPath error:nil];
    NSObject *p;
    for (p in paths) {
        NSLog(@"%@",p);
    }
    /*结果：
     documents
     est.txt
     */
}

/*文件操作*/
void test2(){
    NSFileManager *manager=[NSFileManager defaultManager];
    NSString *filePath=@"/Users/Ivan/Documents/Dev/IOS/MyIOS/TEST/test.txt";
    NSString *filePath2=@"/Users/Ivan/Documents/Dev/IOS/MyIOS/TEST/test2.txt";
    NSString *newPath=@"/Users/Ivan/Documents/Dev/IOS/MyIOS/TEST1/test3.txt";
    
    //判断文件是否存在，这个方法也可以判断目录是否存在，这要后面的参数设置位YES
    if ([manager fileExistsAtPath:filePath isDirectory:NO]) {
        NSLog(@"File exists！");
    }
    
    //文件是否可读
    if([manager isReadableFileAtPath:filePath]){
        NSLog(@"File is readable!");
    }
    
    //判断两个文件内容是否相等
    if ([manager contentsEqualAtPath:filePath andPath:filePath2]) {
        NSLog(@"file1 equals file2");
    }
    
    //文件重命名，方法类似于目录重命名
    if (![manager moveItemAtPath:filePath toPath:newPath error:nil]) {
        NSLog(@"Rename file1 failed!");
    }
    
    //文件拷贝
    NSString *filePath3=@"/Users/Ivan/Documents/Dev/IOS/MyIOS/array.plist";
    if(![manager copyItemAtPath:newPath toPath:filePath3 error:nil]){
        NSLog(@"Copy failed!");
    }
    
    //读取文件属性
    NSDictionary *attributes;
    if ((attributes=[manager attributesOfItemAtPath:newPath error:nil])==nil) {
        NSLog(@"Read attributes failed!");
    }
    for (NSObject *key in attributes) {
        NSLog(@"%@=%@",key,attributes[key]);
    }
    /*结果：
     NSFileOwnerAccountID=501
     NSFileHFSTypeCode=0
     NSFileSystemFileNumber=1781953
     NSFileExtensionHidden=0
     NSFileSystemNumber=16777218
     NSFileSize=27
     NSFileGroupOwnerAccountID=20
     NSFileOwnerAccountName=kenshincui
     NSFileCreationDate=2014-07-28 11:47:58 +0000
     NSFilePosixPermissions=420
     NSFileHFSCreatorCode=0
     NSFileType=NSFileTypeRegular
     NSFileExtendedAttributes={
     "com.apple.TextEncoding" = <7574662d 383b3133 34323137 393834>;
     }
     NSFileGroupOwnerAccountName=staff
     NSFileReferenceCount=1
     NSFileModificationDate=2014-07-28 11:47:58 +0000
     */
    
    //删除文件
    [manager removeItemAtPath:newPath error:nil];
    
}
//文件操作--文件内容操作（NSData，非结构化字节流对象，有缓冲区管理机制，可用于网络传输）
void test3(){
    NSFileManager *manager=[NSFileManager defaultManager];
    NSString *filePath=@"/Users/kenshincui/Desktop/myNewDocument/test2.txt";
    NSData *data=[manager contentsAtPath:filePath];
    NSLog(@"%@",data);//存储的时二进制字节流
    //结果:<68656c6c 6f20776f 726c642c e4b896e7 958ce4bd a0e5a5bd efbc81>
    
    //NSData转化成字符串
    NSString *str1=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str1);
    //结果：hello world,世界你好！
    
    //字符串转化成NSData
    NSString *str2=@"Kenshin";
    NSData *data2=[str2 dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",data2);
    
    //当然一般如果仅仅是简单读取文件内容，直接用户NSString方法即可
    NSString *content=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",content);
    //结果：hello world,世界你好！
    
}
//文件操作--细粒度控制文件,文件操作柄
void test4(){
    NSFileManager *manager=[NSFileManager defaultManager];
    NSString *filePath=@"/Users/kenshincui/Desktop/myNewDocument/test2.txt";
    
    //以只读方式打开文件
    NSFileHandle *fileHandle=[NSFileHandle fileHandleForReadingAtPath:filePath];//注意这个方法返回类型为instancetype，也就是说对于上面的NSFileHandle它的返回类型也是NSFileHandle
    NSData *data= [fileHandle readDataToEndOfFile];//完整读取文件
    NSString *newPath=@"/Users/kenshincui/Desktop/test4.txt";
    [manager createFileAtPath:newPath contents:nil attributes:nil];
    NSFileHandle *fileHandle2=[NSFileHandle fileHandleForWritingAtPath:newPath];//以可写方式打开文件
    [fileHandle2 writeData:data];//写入文件内容
    
    [fileHandle2 closeFile];//关闭文件
    
    
    //定位到指定位置,默认在文件开头
    [fileHandle seekToFileOffset:12];
    NSData *data2= [fileHandle readDataToEndOfFile];
    NSLog(@"data2=%@",[[NSString alloc]initWithData:data2 encoding:NSUTF8StringEncoding]);
    //结果：data2=世界你好！
    
    [fileHandle seekToFileOffset:6];
    NSData *data3=[fileHandle readDataOfLength:5];
    NSLog(@"data3=%@",[[NSString alloc]initWithData:data3 encoding:NSUTF8StringEncoding]);
    //结果：data3=world
    
    [fileHandle closeFile];
    
}

//文件路径
void test5(){
    NSString *filePath=@"/Users/kenshincui/Desktop/myDocument";
    NSString *filePath2=@"/Users/kenshincui/Desktop/test.txt";
    
    //临时文件所在目录
    NSString *path=NSTemporaryDirectory();
    NSLog(@"temporary directory is :%@",path);
    //结果：/var/folders/h6/lss6gncs509c2pgzgty3wd_40000gn/T/
    
    NSString *lastComponent= [filePath lastPathComponent];
    NSLog(@"%@",lastComponent); //结果：myDocument
    
    NSLog(@"%@",[filePath stringByDeletingLastPathComponent]);
    //结果：/Users/kenshincui/Desktop
    NSLog(@"%@",[filePath stringByAppendingPathComponent:@"Pictrues"]);
    //结果：/Users/kenshincui/Desktop/myDocument/Pictrues
    NSLog(@"%@",[filePath2 pathExtension]);
    //结果：txt
    
    [[filePath pathComponents] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%i=%@",idx,obj);
    }];
    /*结果：
     0=/
     1=Users
     2=kenshincui
     3=Desktop
     4=myDocument
     */
    
    
}

//文件操作--NSURL
void test6(){
    NSURL *url=[NSURL URLWithString:@"http://developer.apple.com"];
    NSString *str1=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",str1);
}

//文件操作--NSBundle，程序包，一般用于获取Resource中的资源（当然由于当前补充IOS应用没有程序包，只是表示当前程序运行路径）
//在ios中经常用于读取应用程序中的资源文件，如图片、声音、视频等
void test7(){
    //在程序包所在目录创建一个文件
    NSFileManager *manager=[NSFileManager defaultManager];
    NSString *currentPath=[manager currentDirectoryPath];
    NSLog(@"current path is :%@",currentPath);
    //结果：current path is :/Users/kenshincui/Library/Developer/Xcode/DerivedData/FoundationFramework-awxjohcpgsqcpsanqofqogwbqgbx/Build/Products/Debug
    NSString *filePath=[currentPath stringByAppendingPathComponent:@"test.txt"];
    [manager createFileAtPath:filePath contents:[@"Hello,world!" dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    
    
    //利用NSBundle在程序包所在目录查找对应的文件
    NSBundle *bundle=[NSBundle mainBundle];//主要操作程序包所在目录
    //如果有test.txt则返回路径，否则返回nil
    NSString *path=[bundle pathForResource:@"test" ofType:@"txt"];//也可以写成：[bundle pathForResource:@"instructions.txt" ofType:nil];
    NSLog(@"%@",path);
    //结果：/Users/kenshincui/Library/Developer/Xcode/DerivedData/FoundationFramework-awxjohcpgsqcpsanqofqogwbqgbx/Build/Products/Debug/test.txt
    NSLog(@"%@",[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]);
    //结果：Hello,world!
    
    //假设我们在程序运行创建一个Resources目录，并且其中新建pic.jpg，那么用下面的方法获得这个文件完整路径
    NSString *path1= [bundle pathForResource:@"pic" ofType:@"jpg" inDirectory:@"Resources"];
    NSLog(@"%@",path1);
    //结果：/Users/kenshincui/Library/Developer/Xcode/DerivedData/FoundationFramework-awxjohcpgsqcpsanqofqogwbqgbx/Build/Products/Debug/Resources/pic.jpg
}

//****************Method 4 ********数组操作*************//
void test9(){
    //NSArray长度不可变所以初始化的时候就赋值，并且最后以nil结尾
    //此外需要注意NSArray不能存放C语言的基础类型
    NSObject *obj=[[NSObject alloc]init];
    //NSArray *array1=[[NSArray alloc] initWithObjects:@"abc",obj,@"cde",@"opq", nil];
    NSArray *array1=[NSArray arrayWithObjects:@"abc",obj,@"cde",@"opq",@25, nil];
    NSLog(@"%zi",array1.count);//数组长度,结果：5
    NSLog(@"%i",[array1 containsObject:@"cde"]);//是否包含某个对象，结果：1
    NSLog(@"%@",[array1 lastObject]);//最后一个对象，结果：25
    NSLog(@"%zi",[array1 indexOfObject:@"abc"]);//对象所在的位置：0
    
    Person *person1=[Person personWithName:@"Kenshin"];
    Person *person2=[Person personWithName:@"Kaoru"];
    Person *person3=[Person personWithName:@"Rosa"];
    NSArray *array2=[[NSArray alloc]initWithObjects:person1,person2,person3, nil];
    [array2 makeObjectsPerformSelector:@selector(showMessage:) withObject:@"Hello,world!"];//执行所有元素的showMessage方法,后面的参数最多只能有一个
    /*结果：
     My name is Kenshin,the infomation is "Hello,world!".
     My name is Kaoru,the infomation is "Hello,world!".
     My name is Rosa,the infomation is "Hello,world!".
     */
}
//数组的遍历
void test10(){
    NSObject *obj=[[NSObject alloc]init];
    NSArray *array=[[NSArray alloc] initWithObjects:@"abc",obj,@"cde",@"opq",@25, nil];
    //方法1
    for(int i=0,len=array.count;i<len;++i){
        NSLog(@"method1:index %i is %@",i,[array objectAtIndex:i]);
    }
    /*结果：
     method1:index 0 is abc
     method1:index 1 is <NSObject: 0x100106de0>
     method1:index 2 is cde
     method1:index 3 is opq
     method1:index 4 is 25
     */
    
    
    //方法2
    for(id obj in array){
        NSLog(@"method2:index %zi is %@",[array indexOfObject:obj],obj);
    }
    /*结果：
     method2:index 0 is abc
     method2:index 1 is <NSObject: 0x100602f00>
     method2:index 2 is cde
     method2:index 3 is opq
     method2:index 4 is 25
     */
    
    
    //方法3,利用代码块方法
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"method3:index %zi is %@",idx,obj);
        if(idx==2){//当idx=2时设置*stop为YES停止遍历
            *stop=YES;
        }
    }];
    /*结果：
     method3:index 0 is abc
     method3:index 1 is <NSObject: 0x100106de0>
     method3:index 2 is cde
     */
    
    
    //方法4，利用迭代器
    //NSEnumerator *enumerator= [array objectEnumerator];//获得一个迭代器
    NSEnumerator *enumerator=[array reverseObjectEnumerator];//获取一个反向迭代器
    //NSLog(@"all:%@",[enumerator allObjects]);//获取所有迭代对象，注意调用完此方法迭代器就遍历完了，下面的nextObject就没有值了
    id obj2=nil;
    while (obj2=[enumerator nextObject]) {
        NSLog(@"method4:%@",obj2);
    }
    /*结果：
     method4:25
     method4:opq
     method4:cde
     method4:<NSObject: 0x100106de0>
     method4:abc
     */
}
//数组派生出新的数组
void test11(){
    NSArray *array=[NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSArray *array2=[array arrayByAddingObject:@"4"];//注意此时array并没有变
    NSLog(@"%@",array2);
    /*结果：
     (
     1,
     2,
     3,
     4
     )
     */
    
    
    NSLog(@"%@",[array2 arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"5",@"6", nil]]);//追加形成新的数组
    /*结果：
     (
     1,
     2,
     3,
     4,
     5,
     6
     )
     */
    
    
    NSLog(@"%@",[array2 subarrayWithRange:NSMakeRange(1, 3)]);//根据一定范围取得生成一个新的数组
    /*结果：
     (
     2,
     3,
     4
     )
     */
    
    
    NSLog(@"%@",[array componentsJoinedByString:@","]);//数组连接，形成一个字符串
    //结果：1,2,3
    
    //读写文件
    NSString *path=@"/Users/KenshinCui/Desktop/array.xml";
    [array writeToFile:path atomically:YES];
    NSArray *array3=[NSArray arrayWithContentsOfFile:path];
    NSLog(@"%@",array3);
    /*结果：
     (
     1,
     2,
     3
     )
     */
}
//数组排序
void test12(){
    //方法1,使用自带的比较器
    NSArray *array=[NSArray arrayWithObjects:@"3",@"1",@"2", nil];
    NSArray *array2= [array sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@",array2);
    /*结果：
     (
     1,
     2,
     3
     )
     */
    
    
    //方法2,自己定义比较器
    Person *person1=[Person personWithName:@"Kenshin"];
    Person *person2=[Person personWithName:@"Kaoru"];
    Person *person3=[Person personWithName:@"Rosa"];
    NSArray *array3=[NSArray arrayWithObjects:person1,person2,person3, nil];
    NSArray *array4=[array3 sortedArrayUsingSelector:@selector(comparePerson:)];
    NSLog(@"%@",array4);
    /*结果：
     (
     "name=Kaoru",
     "name=Kenshin",
     "name=Rosa"
     )
     */
    
    
    //方法3使用代码块
    NSArray *array5=[array3 sortedArrayUsingComparator:^NSComparisonResult(Person *obj1, Person *obj2) {
        return [obj2.name compare:obj1.name];//降序
    }];
    NSLog(@"%@",array5);
    /*结果：
     (
     "name=Rosa",
     "name=Kenshin",
     "name=Kaoru"
     )
     */
    
    
    //方法4 通过描述器定义排序规则
    Person *person4=[Person personWithName:@"Jack"];
    Person *person5=[Person personWithName:@"Jerry"];
    Person *person6=[Person personWithName:@"Tom"];
    Person *person7=[Person personWithName:@"Terry"];
    NSArray *array6=[NSArray arrayWithObjects:person4,person5,person6,person7, nil];
    //定义一个排序描述
    NSSortDescriptor *personName=[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSSortDescriptor *accountBalance=[NSSortDescriptor sortDescriptorWithKey:@"account.balance" ascending:YES];
    NSArray *des=[NSArray arrayWithObjects:personName,accountBalance, nil];//先按照person的name排序再按照account的balance排序
    NSArray *array7=[array6 sortedArrayUsingDescriptors:des];
    NSLog(@"%@",array7);
    /*结果：
     (
     "name=Jack",
     "name=Jerry",
     "name=Terry",
     "name=Tom"
     )
     */
}


//****************Method 5 ********字典操作*************//
//****************Method 6 ********映射操作*************//

void map(){
    /*常用方法*/
    Person *person1=[Person personWithName:@"Kenshin"];
    NSLog(@"%i",[person1 isKindOfClass:[NSObject class]]); //判断一个对象是否为某种类型（如果是父类也返回YES），结果：1
    NSLog(@"%i",[person1 isMemberOfClass:[NSObject class]]); //判断一个对象是否是某个类的实例化对象，结果：0
    NSLog(@"%i",[person1 isMemberOfClass:[Person class]]); //结果：1
    NSLog(@"%i",[person1 conformsToProtocol:@protocol(NSCopying)]);//是否实现了某个协议，结果：0
    NSLog(@"%i",[person1 respondsToSelector:@selector(showMessage:)]);//是否存在某个方法，结果：1
    
    [person1 showMessage:@"Hello,world!"];//直接调用一个方法
    [person1 performSelector:@selector(showMessage:) withObject:@"Hello,world!"];
    //动态调用一个方法，注意如果有参数那么参数类型只能为ObjC对象，并且最多只能有两个参数
    
    
    /*反射*/
    //动态生成一个类
    NSString *className=@"Person";
    Class myClass=NSClassFromString(className);//根据类名生成类
    Person *person2=[[myClass alloc]init]; //实例化
    person2.name=@"Kaoru";
    NSLog(@"%@",person2);//结果：name=Kaoru
    
    //类转化为字符串
    NSLog(@"%@,%@",NSStringFromClass(myClass),NSStringFromClass([Person class])); //结果：Person,Person
    
    //调用方法
    NSString *methodName=@"showMessage:";
    SEL mySelector=NSSelectorFromString(methodName);
    Person *person3=[[myClass alloc]init];
    person3.name=@"Rosa";
    [person3 performSelector:mySelector withObject:@"Hello,world!"]; //结果：My name is Rosa,the infomation is "Hello,world!".
    
    //方法转化为字符串
    NSLog(@"%@",NSStringFromSelector(mySelector)); //结果：showMessage:
    
}
int main(int argc, char * argv[]) {
    //Method 1
    //归档
    Person *person1=[[Person alloc]init];
    person1.name=@"Kenshin";
    person1.age=28;
    person1.height=1.72;
    NSDateFormatter *formater1=[[NSDateFormatter alloc]init];
    formater1.dateFormat=@"yyyy-MM-dd";
    person1.birthday=[formater1 dateFromString:@"1986-08-08"];
//    NSLog(@"formater:",birthday);

    NSString *path1=@"/Users/Ivan/test.arc";
    
    [NSKeyedArchiver archiveRootObject:person1 toFile:path1];
    
    //解档
    Person *person2= [NSKeyedUnarchiver unarchiveObjectWithFile:path1];
    NSLog(@"%@",person2);
    /*结果：
     name=Kenshin,age=28,height=0.00,birthday=1986-08-08
     */
    //xml属性
    /*
    test1();
     */
    //Method3  文件操作
    /*
    test8();
    test2();
    test3();
    test4();
    test5();
    test6();
    test7();
    **/
    //Method4  数组操作
//    test9();
//    test10();
//    test11();
//    test12();
    //Method5  数组操作
    //Method6  映射操作
    map();
    return 0;

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
   }
