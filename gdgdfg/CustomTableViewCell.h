//
//  CustomTableViewCell.h
//  gdgdfg
//
//  Created by JINGDIAOXIAN01 on 14-5-28.
//  Copyright (c) 2014年 JINGDIAOXIAN01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *merchandiseName;
@property (weak, nonatomic) IBOutlet UILabel *merchandiseTime;
@property (weak, nonatomic) IBOutlet UILabel *merchandiseState;
@property (weak, nonatomic) IBOutlet UILabel *merchandiseID;
@property(copy,nonatomic)NSString *name;
@property(copy,nonatomic)NSString *time;
@property(copy,nonatomic)NSString *state;
@property(copy,nonatomic)NSString *ID;
@end
