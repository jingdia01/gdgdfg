//
//  MerchandiseListViewController.h
//  gdgdfg
//
//  Created by JINGDIAOXIAN01 on 14-5-27.
//  Copyright (c) 2014年 JINGDIAOXIAN01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchandiseListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *list;
@property (copy,nonatomic) NSString *merchandise;

@property (strong, nonatomic) IBOutlet UILabel *merchandiName;
@property (copy ,nonatomic)NSString *TEST;

@end
