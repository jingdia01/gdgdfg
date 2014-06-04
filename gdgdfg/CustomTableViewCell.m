//
//  CustomTableViewCell.m
//  gdgdfg
//
//  Created by JINGDIAOXIAN01 on 14-5-28.
//  Copyright (c) 2014年 JINGDIAOXIAN01. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize name;
@synthesize time;
@synthesize state;
@synthesize ID;
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setName:(NSString *)n{
    if (![n isEqualToString:name]) {
        name = [n copy];
        self.merchandiseName.text = name;
    }
}

-(void)setTime:(NSString *)t{
    if (![t isEqualToString:time]) {
        time = [t copy];
        self.merchandiseTime.text = time;
    }
}

-(void)setState:(NSString *)s{
    if (![s isEqualToString:state]) {
        state = [s copy];
        self.merchandiseState.text = state;
    }
}

-(void)setID:(NSString *)I{
    if (![I isEqualToString:ID]) {
        ID = [I copy];
        self.merchandiseID.text = ID;
    }
}
@end
