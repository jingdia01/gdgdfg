//
//  MaterlistTableViewController.h
//  gdgdfg
//
//  Created by JINGDIAOXIAN01 on 14-6-3.
//  Copyright (c) 2014年 JINGDIAOXIAN01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaterlistTableViewController : UITableViewController<UITableViewDelegate>
@property (strong, nonatomic) NSArray *list;
@property(strong,nonatomic)NSString *order;

@end
