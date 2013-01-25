//
//  ViewController.m
//  GDataXML
//
//  Created by huangbo on 13-1-9.
//  Copyright (c) 2013年 huangbo. All rights reserved.
//

#import"GDataXMLNode.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize dict;
@synthesize list;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  //  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
   // self.window.backgroundColor = [UIColorwhiteColor];
   // [self.windowmakeKeyAndVisible];
    
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"users" ofType:@"xml"];
    // NSString *filePath = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //使用NSData对象初始化
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData  options:0 error:nil];
    list=[[NSMutableArray alloc] initWithCapacity:10];
    dict=[[NSMutableDictionary alloc] init];
    //获取根节点（Users）
    GDataXMLElement *rootElement = [doc rootElement];
    NSArray *anyTypes=[rootElement elementsForName:@"User"];
    NSInteger i=0;
    for (GDataXMLElement *anyType in anyTypes ) {
        
        GDataXMLElement *NameID=[[anyType  elementsForName:@"name"] objectAtIndex:0];
        NSString *Name = [NameID stringValue];
        NSLog(@"name is %@",Name);        
        
        GDataXMLElement *FtpPathID=[[anyType elementsForName:@"age"] objectAtIndex:0];
        NSString *FtpPath=[FtpPathID stringValue];
        NSLog(@"age is %@",FtpPath);
        [dict setObject:FtpPath forKey:[[NSString alloc] initWithFormat:@"%d",i]];
        [list addObject:Name];
        i++;
    }
 
   /* //获取工程目录的xml文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //使用NSData对象初始化
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData  options:0 error:nil];
    
    //获取根节点（Users）
    GDataXMLElement *rootElement = [doc rootElement];
    
    //获取根节点下的节点（User）
    NSArray *users = [rootElement elementsForName:@"User"];
    
    for (GDataXMLElement *user in users) {
        //User节点的id属性
        NSString *userId = [[user attributeForName:@"id"] stringValue];
        NSLog(@"User id is:%@",userId);
        
        //获取name节点的值
        GDataXMLElement *nameElement = [[user elementsForName:@"name"] objectAtIndex:0];
        NSString *name = [nameElement stringValue];
        NSLog(@"User name is:%@",name);
        
        //获取age节点的值
        GDataXMLElement *ageElement = [[user elementsForName:@"age"] objectAtIndex:0];
        NSString *age = [ageElement stringValue];
        NSLog(@"User age is:%@",age);
        NSLog(@"-------------------");
    }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark tableview datasource method
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dict count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *FilsPath=@"FilsPath";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:FilsPath];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:FilsPath];
    }
    cell.textLabel.text=[list objectAtIndex:[indexPath row]];
    cell.detailTextLabel.text=[dict objectForKey:[[NSString alloc] initWithFormat:@"%d",[indexPath row]]]; //[list objectAtIndex:[indexPath row]];
    return cell;
}







@end
