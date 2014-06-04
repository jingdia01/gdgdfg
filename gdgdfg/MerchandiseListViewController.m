//
//  MerchandiseListViewController.m
//  gdgdfg
//
//  Created by JINGDIAOXIAN01 on 14-5-27.
//  Copyright (c) 2014年 JINGDIAOXIAN01. All rights reserved.
//

#import "MerchandiseListViewController.h"
#import "MerchandiseDetailViewController.h"
#import "DetailTableViewController.h"
#import "CustomTableViewCell.h"
@interface MerchandiseListViewController ()

@end

@implementation MerchandiseListViewController
@synthesize merchandiName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.merchandise;
    NSArray *array = [[NSArray alloc] initWithObjects:@"跟单管理", @"日报管理",
                      @"客户订单",nil];
    self.list = array;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//datasource协议
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return[self.list count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CustomCell = @"CustomCell";
    BOOL nibsRegistered = false;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CustomCell];
        nibsRegistered = true;
    }
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCell];
    
    
    NSUInteger row = [indexPath row];
    //cell.textLabel.text = [self.list objectAtIndex:row];
    cell.name =[self.list objectAtIndex:row];
    cell.time = @"2014年5月26日";
    cell.state = @"进行中";
    
    
    return cell;
}
//delegate协议
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   /* UIAlertView* showSelection;
    NSString *message;
    
    message =[[NSString alloc]initWithFormat:@"you choose is:%@",[self.list objectAtIndex:indexPath.row]];
    
    showSelection = [[UIAlertView alloc]
                     initWithTitle:@"selected"
                     message:message
                     delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:@"Cancel", nil];
    [showSelection autoContentAccessingProxy];
    [showSelection show];*/
    //self.merchandise = [self.list objectAtIndex:indexPath.row];
    //MerchandiseDetailViewController *detail = [[MerchandiseDetailViewController alloc]init];
    //DetailTableViewController *detail = [[DetailTableViewController alloc]init];
    //[self.navigationController pushViewController:detail animated:YES];
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"detail" sender:self];
        
    }
    
    if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"daily" sender:self];

    }
    

    
}


/*#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString* data = self.merchandise;
    UIViewController* view = segue.destinationViewController;
    if ([view respondsToSelector:@selector(setParam:)]) {
        [view setValue:data forKey:@"param"];
    }
}
*/

@end
