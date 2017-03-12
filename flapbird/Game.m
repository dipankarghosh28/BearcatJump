//
//  Game.m
//  flapbird
//
//  Created by Dipankar Ghosh on 3/11/17.
//  Copyright © 2017 Dipankar Ghosh. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game


-(IBAction)startgame:(id)sender //Start button
{
    
    TopPipe.hidden = NO; //top pipe is not hidden anymore
    BottomPipe.hidden = NO; //bottom pipe is not hidden anymore
    
    startgame.hidden = YES; //start game button is hidden
    
    bearcatshift = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(bearcatmovement) userInfo:nil repeats:YES]; //shifting the bearcat by calling the bearcaMoving method.
    
    [self putpipes];
    
    pipeshift = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(pipemove) userInfo:nil repeats:YES]; // shifting the pipe after a given interval using the selector pipemove/method pipemove.
}

-(void)pipemove //method pipemove
{
    
    TopPipe.center = CGPointMake(TopPipe.center.x - 1, TopPipe.center.y);
    BottomPipe.center = CGPointMake(BottomPipe.center.x -1, BottomPipe.center.y);
    
    if(TopPipe.center.x < - 39)
    {
        [self putpipes]; //calls the method putpipes
    }
    
    if(TopPipe.center.x == 25)
    {
        [self Score]; //calls the method score
    }
    
    if(CGRectIntersectsRect(bearcat.frame, TopPipe.frame)) // using CGRectIntersectRect if the bearcat frame touches the top pipe frame -> gameover
    {
        [self gameover];
    }
    
    if(CGRectIntersectsRect(bearcat.frame, BottomPipe.frame))// using CGRectIntersectRect if the bearcat frame touches the bottom pipe frame -> gameover
    {
        [self gameover];
    }
    
    if(CGRectIntersectsRect(bearcat.frame, Ground.frame))
    {
        [self gameover];// using CGRectIntersectRect if the bearcat frame touches the ground frame -> gameover
    }
    
}

-(void)Score //method score
{
    ScoreValue = ScoreValue + 1; //incerementing the scorevalue with 1
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreValue]; //shows the score value.
    
}

-(void)putpipes //method putpipes
{
    randtoppipeplace = arc4random() %360; //random position of the top pipe
    randtoppipeplace = randtoppipeplace -200;
    randbotpipeplace = randtoppipeplace + 530;
    
    TopPipe.center = CGPointMake(340, randtoppipeplace); //topPipe.center -> randtoppipeplace
    BottomPipe.center = CGPointMake(340, randbotpipeplace); //bottomPipe.center -> randbotpipeplace
    
}

-(void)bearcatmovement //method bearcatmovement
{
    
    bearcat.center = CGPointMake(bearcat.center.x, bearcat.center.y - bearcatFlight);
    bearcatFlight = bearcatFlight - 5;
    
    if(bearcatFlight < -15)
    {bearcatFlight = -15; //lowering the flight variable value.
    }
    
    if(bearcatFlight <= 5)
    {bearcat.image = [UIImage imageNamed:@"bcat.png"];//bearcat image -> bcat.png
    }
    }

-(void)gameover
{
    
    [pipeshift invalidate];   //invalidating the pipeshift method once the game is over.
    [bearcatshift invalidate];//invalidating the bearcatshift method once the game is over.
    
    Menu.hidden = NO;         //once game over the menu button is again displayed.
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
bearcatFlight = 30; //initializing the bearcatFlight with some value.
}


- (void)viewDidLoad
{
    
    TopPipe.hidden = YES; //top pipe is hidden
    BottomPipe.hidden = YES; //bottom pipe is hidden
    Menu.hidden = YES;//menu is hidden
    ScoreValue = 0;//scorevalue is set to 0
    
    [super viewDidLoad]; // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; // Dispose of any resources that can be recreated.
}

@end
