//
//  BBViewController.m
//  BBTableView
//
//  Created by Hahn.Chan on 7/22/14.
//  Copyright (c) 2014 Hahn.Chan. All rights reserved.
//

#import "BBViewController.h"

@interface BBViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableView;
}

@end

@implementation BBViewController

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
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor redColor]];
    //UISegmentedControl *seg = [[UISegmentedControl alloc] initWithFrame:<#(CGRect)#>]
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0 , 0, self.view.frame.size.width , self.view.frame.size.height)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    else {
        while ([cell.contentView.subviews lastObject ]!=nil) {
            [(UIView*)[cell.contentView.subviews lastObject]removeFromSuperview];
        }
    }
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(120, 3, 50, 50)];
    iv.animationImages = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"1"],
                          [UIImage imageNamed:@"2"],
                          [UIImage imageNamed:@"3"],
                          [UIImage imageNamed:@"4"],nil];
    iv.animationDuration = 0.5f;
    [iv startAnimating];
    iv.backgroundColor = [UIColor redColor];
    [cell addSubview:iv];

    
    cell.textLabel.text = @"sdasd";
    //cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
