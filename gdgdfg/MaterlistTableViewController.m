//
//  MaterlistTableViewController.m
//  gdgdfg
//
//  Created by JINGDIAOXIAN01 on 14-6-3.
//  Copyright (c) 2014年 JINGDIAOXIAN01. All rights reserved.
//

#import "MaterlistTableViewController.h"
#import "CustomTableViewCell.h"
#import "MerchandiseListViewController.h"
@interface MaterlistTableViewController ()

@end

@implementation MaterlistTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array = [[NSArray alloc] initWithObjects:@"苹果倒角", @"去毛刺",
                      @"个性轮毂",nil];
    self.list = array;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return[self.list count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CustomCell = @"CustomCell";
    BOOL nibsRegistered1 = NO;
    if (!nibsRegistered1) {
        UINib *nib = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CustomCell];
        nibsRegistered1 = YES;
    }
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCell];
    
    
    NSUInteger row = [indexPath row];
    //cell.textLabel.text = [self.list objectAtIndex:row];
    cell.name =[self.list objectAtIndex:row];
    cell.time = @"2014年6月2日";
    cell.state = @"查看";
    cell.ID = @"00000001";
    
    return cell;
}
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
////self.merchandise = [self.list objectAtIndex:indexPath.row];
//MerchandiseDetailViewController *detail = [[MerchandiseDetailViewController alloc]init];
//DetailTableViewController *detail = [[DetailTableViewController alloc]init];
//[self.navigationController pushViewController:detail animated:YES];
////[self performSegueWithIdentifier:@"sdsdg" sender:self];
    
        self.order = [self.list objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"merchandiseList" sender:self];
    
    

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *data = self.order;
     MerchandiseListViewController *view = segue.destinationViewController;
    if ([view respondsToSelector:@selector(setMerchandise:)]) {
        [view setValue:data forKey:@"Merchandise"];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
