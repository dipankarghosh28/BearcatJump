//
//  Game.h
//  flapbird
//
//  Created by Dipankar Ghosh on 3/11/17.
//  Copyright © 2017 Dipankar Ghosh. All rights reserved.
//
#import <UIKit/UIKit.h>

int bearcatFlight; //Bearcat flight variable
int randbotpipeplace; //random bottom pipe place
int randtoppipeplace; //random top pipe place
int ScoreValue;


@interface Game : UIViewController
{

    IBOutlet UIImageView *Ground;
    IBOutlet UIButton *Menu;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UIImageView *bearcat;
    IBOutlet UIButton *startgame;
    IBOutlet UIImageView *TopPipe;
    IBOutlet UIImageView *BottomPipe;
    
    NSTimer *bearcatshift;
    NSTimer *pipeshift;
    
    
    
}

-(IBAction)startgame:(id)sender;
-(void)bearcatmovement;
-(void)pipemove;
-(void)putpipes;
-(void)Score;
-(void)gameover;


@end
