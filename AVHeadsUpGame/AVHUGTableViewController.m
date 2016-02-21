//
//  AVHUGTableViewController.m
//  AVHeadsUpGame
//
//  Created by Ayuna Vogel on 2/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "AVHUGTableViewController.h"
#import "AVHUGAPIManager.h"

@interface AVHUGTableViewController ()

@property (nonatomic) NSArray *topics;
@property (nonatomic) AVHUGObject *object;

@end

@implementation AVHUGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.object = [[AVHUGObject alloc]init];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self fetchAPIData];
}

#pragma mark - fetch API Data

- (void)fetchAPIData {
    
    self.topics = [[NSArray alloc]init];

    [AVHUGAPIManager getData:^(NSArray *data) {
 
        self.topics = data;
        
        NSLog(@"self.topics after fetching api data is %@", self.topics);
        NSLog(@"self.topics count is %ld", self.topics.count);
        
//        for (NSDictionary *topic in self.topics) {
//            self.object.title = topic[@"title"];
//            self.object.subjects = topic[@"subjects"];
//        }
        
        [self.tableView reloadData];
    
    }];
    
   }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicTitleCellIdentifier" forIndexPath:indexPath];
    
    NSDictionary *topic = self.topics[indexPath.row];
    NSString *title = topic[@"title"];
    cell.textLabel.text = title;
    
    
//    for (NSDictionary *topic in self.topics) {
//        self.object.title = topic[@"title"];
//        self.object.subjects = topic[@"subjects"];
//        cell.textLabel.text = topic[@"title"][indexPath.row];
//    }
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
