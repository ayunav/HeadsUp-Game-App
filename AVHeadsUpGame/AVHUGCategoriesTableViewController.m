//
//  AVHUGCategoriesTableViewController.m
//  AVHeadsUpGame
//
//  Created by Ayuna Vogel on 2/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "AVHUGCategoriesTableViewController.h"
#import "AVHUGCluesViewController.h"
#import "AVHUGAPIManager.h"


@interface AVHUGCategoriesTableViewController ()

@property (nonatomic) NSArray *categories;

@property (nonatomic) AVHUGObject *object;

@end

@implementation AVHUGCategoriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.object = [[AVHUGObject alloc]init];
    
    [self setupNavigationBarUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [self fetchAPIData];
}

#pragma mark - setup Navigation Bar UI

- (void)setupNavigationBarUI {
    
//    self.navigationItem.title = @"Heads Up!";
//    
//    // change the navBar title color to orange http://stackoverflow.com/questions/599405/iphone-navigation-bar-title-text-color
//    
//    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor orangeColor]}];
//    
//    // change the back button color to orange
//    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
//    
}

#pragma mark - fetch API Data

- (void)fetchAPIData {
    
    // an array of dictionaries
    self.categories = [[NSArray alloc]init];

    [AVHUGAPIManager getData:^(NSArray *data) {
 
        self.categories = data;
        
        NSLog(@"self.categories after fetching api data is %@", self.categories);
        NSLog(@"self.categories count is %ld", self.categories.count);
        
        for (NSDictionary *category in self.categories) {
            self.object.title = category[@"title"];
            self.object.subjects = category[@"subjects"];
        }
        
        [self.tableView reloadData];
    
    }];
    
   }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicTitleCellIdentifier" forIndexPath:indexPath];
    
    NSDictionary *category = self.categories[indexPath.row];
    NSString *title = category[@"title"];
    cell.textLabel.text = title;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AVHUGCluesViewController *vc = segue.destinationViewController;
    
    NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
    
    NSDictionary *category = [self.categories objectAtIndex:ip.row];
    
    vc.category = category;
}

@end
