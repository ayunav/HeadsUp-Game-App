# Heads Up game iOS app
This is a simple iOS app implementation of the Ellen Degeneres classic, Heads Up! If you're unfamiliar with the game, please refer to the following video: https://youtu.be/PO_ezpX7DwY  

**How It Works**

This app consists of a UITableViewController that displays a list of game topics and a UIViewController where the main game action takes place. All data is pulled from the public API [link](https://heads-up-api.herokuapp.com). 

When a user selects a topic, a user is redirected to a game screen. The game starts automatically in 5 seconds. If your clues hepled a user to name the right subject, a user swipes left (guessed correct). If a user can't guess or guessed wrong, a user swipes right to pass to the next subject.  

When the timer is up, the app lets the user know how many answers they got right (eg. 3/8). 

 
 
**Technical Implementation**


1) UITableViewController    
2) CocoaPods  
3) AFNetworking  
4) API   
5) NSTimer     
6) UISwipeGestureRecognizer 
7) UIAlertController

![gif](https://github.com/ayunav/HeadsUp-Game-App/blob/master/HeadsUpGame.gif)



