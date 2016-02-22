# Heads Up game iOS app
Simple iOS app implementation of the Heads Up game. 

If you're unfamiliar with the game, please refer to the following video: https://youtu.be/PO_ezpX7DwY The game was first presented in the Ellen Degeneres show who launched the original Heads Up game app. 

**How It Works**

This app consists of a UITableViewController that displays a list of game topics and a UIViewController where the main game action takes place. All data is pulled from the public API [link](https://heads-up-api.herokuapp.com). 

When a user selects a topic, she is redirected to a game screen. The game starts automatically in 5 seconds. If your clues hepled a user to name the right subject, a user swipes left (guessed correct). The screen changes color to green and the text to "correct" for one second before the new subject is displayed automatically. If a user can't guess or guessed wrong, a user swipes right to pass to the next subject. The screen changes color to orange and the text to "pass" for one second before a new subject is presented. 

A user has 1 minute to guess the maximum number of subjects in a category. When the timer is up, the app lets the user know how many answers they got right (eg. 3/8). 

 
 
**Technical Implementation**


1) UITableViewController    
2) CocoaPods  
3) AFNetworking  
4) API   
5) NSTimer     
6) UISwipeGestureRecognizer    

![gif](https://github.com/ayunav/HeadsUp-Game-App/blob/master/HeadsUpGame.gif)



