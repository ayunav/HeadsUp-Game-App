//
//  AVHUGViewController.m
//  AVHeadsUpGame
//
//  Created by Ayuna Vogel on 2/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "AVHUGViewController.h"

@interface AVHUGViewController ()

@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;

@end

@implementation AVHUGViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.subjectLabel.text = self.category[@"subjects"][0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
