# Heads Up game iOS app
Simple iOS app implementation of the Heads Up game. 

If you're unfamiliar with the game, please refer to the following video: https://www.youtube.com/watch?v=PO_ezpX7DwY (Ellen Degeneres came up with the game). 

**Features**

This app consists of a UITableViewController that displays a list of game topics pulled from the public API [link](https://heads-up-api.herokuapp.com) and a UIViewController where the main game action takes place. 

When the user selects a topic, a user is redirected to a game screen. The game starts automatically in 5 seconds. If your clues hepled a user to name the right subject, a user swipes left (guessed correct). If a user can't guess or guessed wrong, a user swipes right to pass to the next subject.

When the timer is up, the app lets the user know how many answers they got right (eg. 3/8). 

 
 
**Technical Implementation**


1) UITableViewController    
2) CocoaPods  
3) AFNetworking  
3) API   
4) NSTimer     
3) UISwipeGestureRecognizer    

![gif](https://github.com/ayunav/HeadsUp-Game-App/blob/master/HeadsUpGame.gif)



