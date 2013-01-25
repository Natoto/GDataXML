//
//  ViewController.h
//  GDataXML
//
//  Created by huangbo on 13-1-9.
//  Copyright (c) 2013年 huangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tableview;
}
@property(nonatomic,retain) NSMutableDictionary *dict;
@property(nonatomic,retain) NSMutableArray *list;
@end
