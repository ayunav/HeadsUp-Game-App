//
//  AVHUGGameViewController.m
//  AVHeadsUpGame
//
//  Created by Ayuna Vogel on 2/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "AVHUGGameViewController.h"

@interface AVHUGGameViewController ()

@property (nonatomic) NSArray *subjects;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;

@property (nonatomic) NSInteger cluesCount;
@property (nonatomic) NSInteger cluesCountGuessedRight;
@property (nonatomic) NSInteger timerCount;
@property (nonatomic) NSInteger gameTimerCount;

@property (nonatomic) NSInteger index;

// http://brandcolors.net
@property (nonatomic) UIColor *twitterBlue;
@property (nonatomic) UIColor *fiveHundredPxRed;

@end

@implementation AVHUGGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.twitterBlue = [UIColor colorWithRed:85.00/255.0 green:172.00/255.0 blue:238.00/255.0 alpha:1.0];
    self.fiveHundredPxRed = [UIColor colorWithRed:255.00/255.0 green:76.00/255.0 blue:76.00/255.0 alpha:1.0];

    self.subjects = [[NSArray alloc]init];
    self.subjects = self.category[@"subjects"];
    NSLog(@"subjects.count in GameViewController is %ld", self.subjects.count);
    
    self.cluesCount = 0;
    self.cluesCountGuessedRight = 0;
    
    [self startGetReadyTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Get Ready timer setup

- (void)startGetReadyTimer
{
    self.view.backgroundColor = self.twitterBlue;
    self.subjectLabel.text = @"GET READY";
    
    NSTimer *getReadyTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(getReadyTimerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:getReadyTimer forMode:NSRunLoopCommonModes];
    self.timerCount = 5;
    [getReadyTimer fire];
}

- (void)getReadyTimerFired:(NSTimer *)timer
{
    
    if (self.timerCount == 0) {
        [timer invalidate];
        [self startGameTimer];
    }
    
    NSString *convertTimerCountToString = [[NSNumber numberWithInteger:self.timerCount]stringValue];
    self.timerLabel.text = convertTimerCountToString;
    
    self.timerCount--;
}

#pragma mark - Start Game timer setup

- (void)startGameTimer
{
    NSTimer *gameTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(gameTimerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:gameTimer forMode:NSRunLoopCommonModes];
    self.gameTimerCount = 60;
    [gameTimer fire];
    
    self.index = 0;
    self.subjectLabel.text = self.category[@"subjects"][self.index];

    [self setupGestureRecognizers];
}

- (void)gameTimerFired:(NSTimer *)timer
{
    
    if (self.gameTimerCount == 0) {
        [timer invalidate];
        [self timeIsUp];
    }
    
    NSString *convertTimerCountToString = [[NSNumber numberWithInteger:self.gameTimerCount]stringValue];
    self.timerLabel.text = convertTimerCountToString;
    
    self.gameTimerCount--;
}

#pragma mark - Correct Timer setup 

- (void)startCorrectTimer
{
    NSTimer *correctTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(correctTimerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:correctTimer forMode:NSRunLoopCommonModes];
    self.timerCount = 1;
    [correctTimer fire];
    

    self.view.backgroundColor = [UIColor greenColor];
    self.cluesCountGuessedRight++;
    self.cluesCount++;
    self.index++;
    self.subjectLabel.text = @"CORRECT";
}

- (void)correctTimerFired:(NSTimer *)timer
{
    
    if (self.timerCount == 0) {
        [timer invalidate];
        self.gameTimerCount -= 1;
        [self showNextClue];
        [self setupGestureRecognizers];
    }
    self.timerCount--;
}

#pragma mark - Pass Timer setup

- (void)startPassTimer
{
    NSTimer *passTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(passTimerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:passTimer forMode:NSRunLoopCommonModes];
    self.timerCount = 1;
    [passTimer fire];

    self.view.backgroundColor = [UIColor orangeColor];
    self.cluesCount++;
    self.index++;
    self.subjectLabel.text = @"PASS";
}

- (void)passTimerFired:(NSTimer *)timer
{
    
    if (self.timerCount == 0) {
        [timer invalidate];
        self.gameTimerCount -= 1;
        [self showNextClue];
        [self setupGestureRecognizers];
    }
    self.timerCount--;
}

#pragma mark - Time is Up

- (void)timeIsUp
{
    self.subjectLabel.text = @"TIME'S UP";
    self.view.backgroundColor = self.fiveHundredPxRed;
    
    // show UIAlertController with game score
    NSString *gameResult = [NSString stringWithFormat:@"You guessed %ld/%ld", self.cluesCountGuessedRight, self.cluesCount];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Final Score"
                                                                   message:gameResult
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"👍"
                                                 style:UIAlertActionStyleDefault
                                               handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}

#pragma mark - Swipe Gesture Recognition Methods

- (void)setupGestureRecognizers
{
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
    left.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
    right.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:left];
    [self.view addGestureRecognizer:right];

}

- (void)handleSwipe:(UISwipeGestureRecognizer *)gesture
{
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionLeft: // guessed correct
            if (self.gameTimerCount >= 2) {
                [self startCorrectTimer];
            }
            break;
        case UISwipeGestureRecognizerDirectionRight: // guessed wrong
            if (self.gameTimerCount >= 2) {
                [self startPassTimer];
            }
            break;
        default:
            return;
    }
}

#pragma mark ShowNextClue method

- (void)showNextClue
{
    self.view.backgroundColor = self.twitterBlue;
    
    if (self.index > self.subjects.count-1) {
        [self timeIsUp];
    }
    
    self.subjectLabel.text = self.category[@"subjects"][self.index];
}

@end
