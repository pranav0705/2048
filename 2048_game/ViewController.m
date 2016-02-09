//
//  ViewController.m
//  2048_game
//
//  Created by Pranav Bhandari on 2/4/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

@synthesize tiles;
@synthesize scoreLabel;
@synthesize restart;
@synthesize score;
@synthesize lb1;
@synthesize name;
NSUserDefaults *hs;
- (void)viewDidLoad {
    [super viewDidLoad];
    hs = [NSUserDefaults standardUserDefaults];
    
    NSInteger highscore = [hs integerForKey:@"HighScore"];
    
    //swiping
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.upSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.downSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    self.upSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    self.downSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.upSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.downSwipeGestureRecognizer];
    
    
    
    
    
    //////////////////////////////////
    
    
   score.layer.shadowColor = [[UIColor redColor] CGColor];
    score.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    score.layer.shadowRadius = 5.0f;
    score.layer.shadowOpacity = 1.0f;
    [score setFont:[UIFont fontWithName:@"chalkduster" size:22.0]];

    
    [scoreLabel setFont:[UIFont fontWithName:@"chalkduster" size:22.0]];
    //adding font and shadows
    UIFont *newFont = [UIFont fontWithName:@"chalkduster" size:26];
    [tiles setValue:newFont forKey:@"font"];
    
    UIColor *color = restart.currentTitleColor;
    
    restart.titleLabel.layer.shadowColor = [color CGColor];
    restart.titleLabel.layer.shadowRadius = 6.0f;
    restart.titleLabel.layer.shadowOpacity = 1;
    restart.titleLabel.layer.shadowOffset = CGSizeZero;
    restart.titleLabel.layer.masksToBounds = NO;
     [restart setFont:[UIFont fontWithName:@"chalkduster" size:22.0]];
    
    
    
    [lb1 setFont:[UIFont fontWithName:@"chalkduster" size:22.0]];
    
    [name setFont:[UIFont fontWithName:@"chalkduster" size:22.0]];
    
    for (int j = 0; j<16; j++) {
         [[tiles objectAtIndex:j] setText:@""];
        [[tiles objectAtIndex:j] setBackgroundColor:[UIColor lightGrayColor]];
        
        
       
    }
   
    for (int i = 0; i < 16; i++) {
         NSInteger randomNumber = arc4random() % 16;
       
        if ([[[tiles objectAtIndex:randomNumber] text]  isEqual: @""]) {
           
            [[tiles objectAtIndex:randomNumber] setText:@"2" ];
          //  [[tiles objectAtIndex:randomNumber] setTextColor:[UIColor whiteColor]];
            [UIView transitionWithView:[tiles objectAtIndex:randomNumber] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                [[tiles objectAtIndex:randomNumber] setTextColor:[UIColor colorWithRed:(24/255.f) green:(24/255.f) blue:(24/255.f) alpha:1]];

                [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(192/255.f) green:(255/255.f) blue:(192/255.f) alpha:1]];

                
                [[tiles objectAtIndex:randomNumber] setShadowColor:[UIColor blueColor]];
            } completion:nil];
            
            
            
            self.scoreLabel.alpha = 0;
            [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
                self.scoreLabel.alpha = 1;
            } completion:nil];
            break;
        }
        

    }
    for (int i = 0; i < 16; i++) {
        NSInteger randomNumber = arc4random() % 16;
       
        if ([[[tiles objectAtIndex:randomNumber] text]  isEqual: @""]) {
            
            [[tiles objectAtIndex:randomNumber] setText:@"2" ];
            //[[tiles objectAtIndex:randomNumber] setTextColor:[UIColor whiteColor]];
            //[[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(233/255.f) green:(138/255.f) blue:(36/255.f) alpha:1]];
            [UIView transitionWithView:[tiles objectAtIndex:randomNumber] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                [[tiles objectAtIndex:randomNumber] setTextColor:[UIColor colorWithRed:(24/255.f) green:(24/255.f) blue:(24/255.f) alpha:1]];
                
                [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(192/255.f) green:(255/255.f) blue:(192/255.f) alpha:1]];
               
                [[tiles objectAtIndex:randomNumber] setShadowColor:[UIColor blueColor]];
            } completion:nil];
            
            self.scoreLabel.alpha = 0;
            [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
                self.scoreLabel.alpha = 1;
            } completion:nil];
            break;
        }
        
        
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//- (IBAction)right:(id)sender
- (IBAction)restart:(id)sender {
   
    
    
   /*
    
    //another one
    UIViewController * contributeViewController = [[UIViewController alloc] init];
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *beView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    beView.frame = self.view.bounds;
    
    contributeViewController.view.frame = self.view.bounds;
    contributeViewController.view.backgroundColor = [UIColor clearColor];
    [contributeViewController.view insertSubview:beView atIndex:0];
    contributeViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    [self presentViewController:contributeViewController animated:YES completion:nil];
    
    
    */
    
    
    //new game
    for(int m = 0 ; m <=15; m++)
    {
        [[tiles objectAtIndex:m] setText:@""];
        [[tiles objectAtIndex:m] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
    }
    
    
    //resetting scores
    [scoreLabel setText:@"0"];
    
    
    //adding a random 2
    for (int i = 0; i < 999; i++) {
        NSInteger randomNumber = arc4random() % 16;
        
        if ([[[tiles objectAtIndex:randomNumber] text]  isEqual: @""]) {
            
            [[tiles objectAtIndex:randomNumber] setText:@"2" ];
            // [[tiles objectAtIndex:randomNumber] setTextColor:[UIColor whiteColor]];
            [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(233/255.f) green:(138/255.f) blue:(36/255.f) alpha:1]];
            
            break;
        }
        
        
    }
    
    //adding a random 2
/*    for (int i = 0; i < 999; i++) {
        NSInteger randomNumber = arc4random() % 16;
        
        if ([[[tiles objectAtIndex:randomNumber] text]  isEqual: @""]) {
            
            [[tiles objectAtIndex:randomNumber] setText:@"2" ];
            // [[tiles objectAtIndex:randomNumber] setTextColor:[UIColor whiteColor]];
            [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(233/255.f) green:(138/255.f) blue:(36/255.f) alpha:1]];
            
            break;
        }
        
        
    }*/
    [self generatingNum];
}

-(void)generatingNum{
   int count = 0;
    Boolean go_flg = false;;
    //checking for gammeOver
    for (int go=0; go<=11; go++)
    {
        count++;
        if([[[tiles objectAtIndex:go] text] isEqual:@""])
        {
            go_flg = true;
        }
        else
        {
        if((count%4) == 0)
        {
            if([[[tiles objectAtIndex:go] text] isEqualToString:[[tiles objectAtIndex:(go+4)] text]])
            {
                go_flg = true;
            }
        }
        else
        {
            if([[[tiles objectAtIndex:go] text] isEqualToString:[[tiles objectAtIndex:(go+1)] text]])
            {
                go_flg = true;
            }
            else if([[[tiles objectAtIndex:go] text] isEqualToString:[[tiles objectAtIndex:(go+4)] text]])
            {
                go_flg = true;
            }
        }
        
            if(go == 11)
            {
                if([[[tiles objectAtIndex:12] text] isEqualToString:[[tiles objectAtIndex:13] text]])
                {
                    go_flg = true;
                }
                else if([[[tiles objectAtIndex:13] text] isEqualToString:[[tiles objectAtIndex:14] text]])
                {
                    go_flg = true;
                }
                else if([[[tiles objectAtIndex:14] text] isEqualToString:[[tiles objectAtIndex:15] text]])
                {
                    go_flg = true;
                }
            }
        }
        
        if(go_flg)
            break;
    }
    
   if(go_flg)
    {
    
     NSMutableArray *myArray = [NSMutableArray array];
    [myArray removeAllObjects];
    for(int i = 0; i <= 15; i++) {
        if([[[tiles objectAtIndex:i] text] isEqual:@""])
        {
            [myArray addObject:[NSNumber numberWithInt:i]];
        }
    }
    
       if([myArray count] != 0)
    {
        num = [[myArray objectAtIndex:arc4random_uniform(myArray.count)] intValue];

   if([[[tiles objectAtIndex:num] text] isEqual:@""])
    {
        
        NSInteger randomNumber = arc4random() % 10;
        if(randomNumber == 7)
        {
            [[tiles objectAtIndex:num] setText: @"4"];
            [UIView transitionWithView:[tiles objectAtIndex:randomNumber] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                [[tiles objectAtIndex:randomNumber] setTextColor:[UIColor whiteColor]];
                [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor orangeColor]];
                
                [[tiles objectAtIndex:randomNumber] setShadowColor:[UIColor blueColor]];
            } completion:nil];
        }
        else
        {
        [[tiles objectAtIndex:num] setText: @"2"];
        [UIView transitionWithView:[tiles objectAtIndex:randomNumber] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [[tiles objectAtIndex:randomNumber] setTextColor:[UIColor whiteColor]];
            [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor orangeColor]];
            
            [[tiles objectAtIndex:randomNumber] setShadowColor:[UIColor blueColor]];
        } completion:nil];
        }
        
     
        
    }
        [myArray removeAllObjects];
    }
        for(int t = 0;t<=15;t++)
        {
            if([[[tiles objectAtIndex:t] text] isEqual:@"2048"])
            {
            
        
        if (!UIAccessibilityIsReduceTransparencyEnabled()) {
            self.view.backgroundColor = [UIColor clearColor];
            
            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
            blurEffectView.frame = self.view.bounds;
            blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [self.view addSubview:blurEffectView];
            
            
            
            
            
            ///additonal
            // Vibrancy effect
            UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
            UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
            [vibrancyEffectView setFrame:self.view.bounds];
            
            // Label for vibrant text
            UILabel *vibrantLabel = [[UILabel alloc] init];
            UIButton *vibrantButton = [[UIButton alloc] init];
            
            [vibrantLabel setText:@"Congragulations, You Did it"];
            [vibrantLabel setFont:[UIFont systemFontOfSize:20.0f]];
            [vibrantLabel sizeToFit];
            [vibrantLabel setCenter: self.view.center];
            
            // Add label to the vibrancy view
            [[vibrancyEffectView contentView] addSubview:vibrantLabel];
            
            // Add the vibrancy view to the blur view
            [[blurEffectView contentView] addSubview:vibrancyEffectView];
        }
                
        else {
            self.view.backgroundColor = [UIColor blackColor];
        }
            }
        
    
        }

    //adding font and shadows
    UIFont *newFont = [UIFont fontWithName:@"chalkduster" size:18];
    [tiles setValue:newFont forKey:@"font"];
    //[[[tiles objectAtIndex:lb] setFont:[UIFont fontWithName:@"chalkduster" size:15.0]]

    
    for(int lb = 0; lb <=15;lb++)
    {
        if([[[tiles objectAtIndex:lb] text] isEqual:@""])
        {
        }
        else
        {
        [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [[tiles objectAtIndex:lb] setTextColor:[UIColor whiteColor]];
            [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor orangeColor]];
            
            [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
        } completion:nil];
            
        
      /*  self.scoreLabel.alpha = 0;
        [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
            self.scoreLabel.alpha = 1;
        } completion:nil]; */
        
        }
    }
    
    
    ///adding colors to tiles
    for(int lb = 0; lb <=15;lb++)
    {
        if([[[tiles objectAtIndex:lb] text] isEqual:@""])
        {
            [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor lightGrayColor]];
        }
        else
        {
          /*  if([[[tiles objectAtIndex:lb] text] isEqual:@"2"])
            {
                [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor orangeColor]];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"4"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(64/255.f) green:(255/255.f) blue:(255/255.f) alpha:1]];

                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(192/255.f) green:(255/255.f) blue:(000/255.f) alpha:1]];

                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"8"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(255/255.f) green:(64/255.f) blue:(000/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(64/255.f) green:(255/255.f) blue:(255/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"16"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor whiteColor]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(000/255.f) blue:(255/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"32"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(255/255.f) green:(000/255.f) blue:(255/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(000/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"64"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor blackColor]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(192/255.f) blue:(192/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"128"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(00/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(00/255.f) green:(00/255.f) blue:(255/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            
            if([[[tiles objectAtIndex:lb] text] isEqual:@"256"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(255/255.f) green:(64/255.f) blue:(000/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(192/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"512"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(128/255.f) green:(255/255.f) blue:(000/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(192/255.f) blue:(128/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            
            if([[[tiles objectAtIndex:lb] text] isEqual:@"1024"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(255/255.f) green:(000/255.f) blue:(000/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(000/255.f) green:(000/255.f) blue:(255/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            
            if([[[tiles objectAtIndex:lb] text] isEqual:@"2048"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor blackColor]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(255/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            } */
            if([[[tiles objectAtIndex:lb] text] isEqual:@"2"])
            {
                [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(24/255.f) green:(24/255.f) blue:(24/255.f) alpha:1]];
                 [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(192/255.f) green:(255/255.f) blue:(192/255.f) alpha:1]];

            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"4"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(24/255.f) green:(24/255.f) blue:(24/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(128/255.f) green:(192/255.f) blue:(128/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"8"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(24/255.f) green:(24/255.f) blue:(24/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(192/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"16"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(24/255.f) green:(24/255.f) blue:(24/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(64/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"32"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(224/255.f) green:(224/255.f) blue:(224/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(128/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"64"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor blackColor]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(224/255.f) green:(224/255.f) blue:(224/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor colorWithRed:(255/255.f) green:(192/255.f) blue:(64/255.f) alpha:1]];

                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"128"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(224/255.f) green:(224/255.f) blue:(224/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(192/255.f) blue:(128/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            
            if([[[tiles objectAtIndex:lb] text] isEqual:@"256"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(224/255.f) green:(224/255.f) blue:(224/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(192/255.f) green:(128/255.f) blue:(128/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            if([[[tiles objectAtIndex:lb] text] isEqual:@"512"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(224/255.f) green:(224/255.f) blue:(224/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(192/255.f) green:(64/255.f) blue:(64/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            
            if([[[tiles objectAtIndex:lb] text] isEqual:@"1024"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor colorWithRed:(255/255.f) green:(000/255.f) blue:(000/255.f) alpha:1]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(000/255.f) green:(000/255.f) blue:(255/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            
            if([[[tiles objectAtIndex:lb] text] isEqual:@"2048"])
            {
                [UIView transitionWithView:[tiles objectAtIndex:lb] duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[tiles objectAtIndex:lb] setTextColor:[UIColor blackColor]];
                    
                    [[tiles objectAtIndex:lb] setBackgroundColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(255/255.f) alpha:1]];
                    
                    
                    [[tiles objectAtIndex:lb] setShadowColor:[UIColor blueColor]];
                } completion:nil];
            }
            
            
        }
    }
   
    }
   else
   {
       if (!UIAccessibilityIsReduceTransparencyEnabled()) {
           self.view.backgroundColor = [UIColor clearColor];
           
           UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
           UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
           blurEffectView.frame = self.view.bounds;
           blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
           [self.view addSubview:blurEffectView];
           
           
           
           
           
           ///additonal
           // Vibrancy effect
           UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
           UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
           [vibrancyEffectView setFrame:self.view.bounds];
           
           // Label for vibrant text
           UILabel *vibrantLabel = [[UILabel alloc] init];
           UIButton *vibrantButton = [[UIButton alloc] init];
           
           [vibrantLabel setText:@"You Lose!!"];
           [vibrantLabel setFont:[UIFont systemFontOfSize:26.0f]];
           [vibrantLabel sizeToFit];
           [vibrantLabel setCenter: self.view.center];
           
           // Add label to the vibrancy view
           [[vibrancyEffectView contentView] addSubview:vibrantLabel];
           
           // Add the vibrancy view to the blur view
           [[blurEffectView contentView] addSubview:vibrancyEffectView];
       }
       else {
           self.view.backgroundColor = [UIColor blackColor];
       }
   }
    
}


//swiping method
- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        
            //making tiles go left
            addNum = false;
            int lft = 0;
            while (lft <= 12) {
                
                //checking first column
                if ([[[tiles objectAtIndex:lft] text] isEqual:@""]) {
                    [[tiles objectAtIndex:lft] setText:[[tiles objectAtIndex:(lft+1)] text]];
                    [[tiles objectAtIndex:(lft+1)] setText:@""];
                    [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    addNum = true;
                    
                }
                
                //checking 2nd column
                if([[[tiles objectAtIndex:(lft+1)] text] isEqual:@""])
                {
                    if([[[tiles objectAtIndex:lft] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:lft] setText:[[tiles objectAtIndex:lft+2] text]];
                        [[tiles objectAtIndex:(lft+2)] setText:@""];
                        [[tiles objectAtIndex:(lft+2)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                    else
                    {
                        [[tiles objectAtIndex:(lft+1)] setText:[[tiles objectAtIndex:lft+2] text]];
                        [[tiles objectAtIndex:(lft+2)] setText:@""];
                        [[tiles objectAtIndex:(lft+2)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                }
                
                //checking 3rd column
                if([[[tiles objectAtIndex:(lft+2)] text] isEqual:@""])
                {
                    if([[[tiles objectAtIndex:lft] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:lft] setText:[[tiles objectAtIndex:lft+3] text]];
                        [[tiles objectAtIndex:(lft+3)] setText:@""];
                        [[tiles objectAtIndex:(lft+3)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                    else if([[[tiles objectAtIndex:(lft+1)] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:(lft+1)] setText:[[tiles objectAtIndex:lft+3] text]];
                        [[tiles objectAtIndex:(lft+3)] setText:@""];
                        [[tiles objectAtIndex:(lft+3)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                    else
                    {
                        [[tiles objectAtIndex:(lft+2)] setText:[[tiles objectAtIndex:lft+3] text]];
                        [[tiles objectAtIndex:(lft+3)] setText:@""];
                        [[tiles objectAtIndex:(lft+3)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                }
                lft = lft + 4;
            }
            
            
            //addition logic
            int k = 0;
            while(k<=12)
            {
                if ([[[tiles objectAtIndex:k] text] isEqualToString:[[tiles objectAtIndex:(k+1)] text]]) {
                    
                    int m = [[[tiles objectAtIndex:k] text] intValue];
                    int n = [[[tiles objectAtIndex:(k+1)] text] intValue];
                    int res = m + n;
                    
                    if(res > 0)
                    {
                        [[tiles objectAtIndex:k] setText :[NSString stringWithFormat:@"%d",res] ];
                        int p = [scoreLabel.text intValue];
                        int scr = p + res;
                        [scoreLabel setText:[NSString stringWithFormat:@"%d",scr]];
                        //emptying the 2nd tile
                        [[tiles objectAtIndex:(k+1)] setText:@""];
                        [[tiles objectAtIndex:(k+1)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                }
                
                //adding 2nd and 3rd column
                if ([[[tiles objectAtIndex:(k+1)] text] isEqualToString:[[tiles objectAtIndex:(k+2)] text]]) {
                    
                    int m = [[[tiles objectAtIndex:(k+1)] text] intValue];
                    int n = [[[tiles objectAtIndex:(k+2)] text] intValue];
                    int res = m + n;
                    
                    if(res > 0)
                    {
                        [[tiles objectAtIndex:(k+1)] setText :[NSString stringWithFormat:@"%d",res] ];
                        int p = [scoreLabel.text intValue];
                        int scr = p + res;
                        [scoreLabel setText:[NSString stringWithFormat:@"%d",scr]];
                        //emptying the 2nd tile
                        [[tiles objectAtIndex:(k+2)] setText:@""];
                        [[tiles objectAtIndex:(k+2)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                }
                
                //adding 3rd and 4th column
                if ([[[tiles objectAtIndex:(k+2)] text] isEqualToString:[[tiles objectAtIndex:(k+3)] text]]) {
                    
                    int m = [[[tiles objectAtIndex:(k+2)] text] intValue];
                    int n = [[[tiles objectAtIndex:(k+3)] text] intValue];
                    int res = m + n;
                    
                    if(res > 0)
                    {
                        [[tiles objectAtIndex:(k+2)] setText :[NSString stringWithFormat:@"%d",res] ];
                        int p = [scoreLabel.text intValue];
                        int scr = p + res;
                        [scoreLabel setText:[NSString stringWithFormat:@"%d",scr]];
                        //emptying the 2nd tile
                        [[tiles objectAtIndex:(k+3)] setText:@""];
                        [[tiles objectAtIndex:(k+3)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                }
                
                k = k + 4;
            }
            
            //making tiles go left
            lft = 0;
            while (lft <= 12) {
                
                //checking first column
                if ([[[tiles objectAtIndex:lft] text] isEqual:@""]) {
                    [[tiles objectAtIndex:lft] setText:[[tiles objectAtIndex:(lft+1)] text]];
                    [[tiles objectAtIndex:(lft+1)] setText:@""];
                    [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    addNum = true;
                }
                
                //checking 2nd column
                if([[[tiles objectAtIndex:(lft+1)] text] isEqual:@""])
                {
                    if([[[tiles objectAtIndex:lft] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:lft] setText:[[tiles objectAtIndex:lft+2] text]];
                        [[tiles objectAtIndex:(lft+2)] setText:@""];
                        [[tiles objectAtIndex:(lft+2)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                    else
                    {
                        [[tiles objectAtIndex:(lft+1)] setText:[[tiles objectAtIndex:lft+2] text]];
                        [[tiles objectAtIndex:(lft+2)] setText:@""];
                        [[tiles objectAtIndex:(lft+2)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                }
                
                //checking 3rd column
                if([[[tiles objectAtIndex:(lft+2)] text] isEqual:@""])
                {
                    if([[[tiles objectAtIndex:lft] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:lft] setText:[[tiles objectAtIndex:lft+3] text]];
                        [[tiles objectAtIndex:(lft+3)] setText:@""];
                        [[tiles objectAtIndex:(lft+3)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                    else if([[[tiles objectAtIndex:(lft+1)] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:(lft+1)] setText:[[tiles objectAtIndex:lft+3] text]];
                        [[tiles objectAtIndex:(lft+3)] setText:@""];
                        [[tiles objectAtIndex:(lft+3)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                    else
                    {
                        [[tiles objectAtIndex:(lft+2)] setText:[[tiles objectAtIndex:lft+3] text]];
                        [[tiles objectAtIndex:(lft+3)] setText:@""];
                        [[tiles objectAtIndex:(lft+3)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                }
                lft = lft + 4;
            }
            
            //adding a random 2
            /* for (int i = 0; i < 999; i++) {
             NSInteger randomNumber = arc4random() % 16;
             
             if ([[[tiles objectAtIndex:randomNumber] text]  isEqual: @""]) {
             
             [[tiles objectAtIndex:randomNumber] setText:@"2" ];
             // [[tiles objectAtIndex:randomNumber] setTextColor:[UIColor whiteColor]];
             [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(233/255.f) green:(138/255.f) blue:(36/255.f) alpha:1]];
             
             break;
             }
             
             
             }*/
            [self generatingNum];
            
        
    }
    
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        
            //making tiles go right
            int lft = 0;
            while (lft <= 12) {
                
                //checking first column
                if ([[[tiles objectAtIndex:(lft+3)] text] isEqual:@""]) {
                    [[tiles objectAtIndex:(lft+3)] setText:[[tiles objectAtIndex:(lft+2)] text]];
                    [[tiles objectAtIndex:(lft+2)] setText:@""];
                    [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    addNum = true;
                    
                }
                
                //checking 2nd column
                if([[[tiles objectAtIndex:(lft+2)] text] isEqual:@""])
                {
                    if([[[tiles objectAtIndex:(lft+3)] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:(lft+3)] setText:[[tiles objectAtIndex:lft+1] text]];
                        [[tiles objectAtIndex:(lft+1)] setText:@""];
                        [[tiles objectAtIndex:(lft+1)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                    else
                    {
                        [[tiles objectAtIndex:(lft+2)] setText:[[tiles objectAtIndex:lft+1] text]];
                        [[tiles objectAtIndex:(lft+1)] setText:@""];
                        [[tiles objectAtIndex:(lft+1)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                        addNum = true;
                    }
                }
                
                //checking 3rd column
                if([[[tiles objectAtIndex:(lft+1)] text] isEqual:@""])
                {
                    addNum = true;
                    if([[[tiles objectAtIndex:(lft+3)] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:(lft+3)] setText:[[tiles objectAtIndex:lft] text]];
                        [[tiles objectAtIndex:(lft)] setText:@""];
                        [[tiles objectAtIndex:(lft)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                    else if([[[tiles objectAtIndex:(lft+2)] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:(lft+2)] setText:[[tiles objectAtIndex:lft] text]];
                        [[tiles objectAtIndex:(lft)] setText:@""];
                        [[tiles objectAtIndex:(lft)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                    else
                    {
                        [[tiles objectAtIndex:(lft+1)] setText:[[tiles objectAtIndex:lft] text]];
                        [[tiles objectAtIndex:(lft)] setText:@""];
                        [[tiles objectAtIndex:(lft)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                }
                lft = lft + 4;
            }
            
            
            
            //addition logic
            int k = 0;
            while(k<=12)
            {
                if ([[[tiles objectAtIndex:(k+3)] text] isEqualToString:[[tiles objectAtIndex:(k+2)] text]]) {
                    
                    int m = [[[tiles objectAtIndex:(k+3)] text] intValue];
                    int n = [[[tiles objectAtIndex:(k+2)] text] intValue];
                    int res = m + n;
                    
                    if(res > 0)
                    {
                        [[tiles objectAtIndex:(k+3)] setText :[NSString stringWithFormat:@"%d",res] ];
                        int p = [scoreLabel.text intValue];
                        int scr = p + res;
                        [scoreLabel setText:[NSString stringWithFormat:@"%d",scr]];
                        //emptying the 2nd tile
                        [[tiles objectAtIndex:(k+2)] setText:@""];
                        [[tiles objectAtIndex:(k+2)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                }
                
                //adding 2nd and 3rd column
                if ([[[tiles objectAtIndex:(k+2)] text] isEqualToString:[[tiles objectAtIndex:(k+1)] text]]) {
                    
                    int m = [[[tiles objectAtIndex:(k+2)] text] intValue];
                    int n = [[[tiles objectAtIndex:(k+1)] text] intValue];
                    int res = m + n;
                    
                    if(res > 0)
                    {
                        [[tiles objectAtIndex:(k+2)] setText :[NSString stringWithFormat:@"%d",res] ];
                        int p = [scoreLabel.text intValue];
                        int scr = p + res;
                        [scoreLabel setText:[NSString stringWithFormat:@"%d",scr]];
                        //emptying the 2nd tile
                        [[tiles objectAtIndex:(k+1)] setText:@""];
                        [[tiles objectAtIndex:(k+1)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                }
                
                //adding 3rd and 4th column
                if ([[[tiles objectAtIndex:(k+1)] text] isEqualToString:[[tiles objectAtIndex:(k)] text]]) {
                    
                    int m = [[[tiles objectAtIndex:(k+1)] text] intValue];
                    int n = [[[tiles objectAtIndex:(k)] text] intValue];
                    int res = m + n;
                    
                    if(res > 0)
                    {
                        [[tiles objectAtIndex:(k+1)] setText :[NSString stringWithFormat:@"%d",res] ];
                        int p = [scoreLabel.text intValue];
                        int scr = p + res;
                        [scoreLabel setText:[NSString stringWithFormat:@"%d",scr]];
                        //emptying the 2nd tile
                        [[tiles objectAtIndex:(k)] setText:@""];
                        [[tiles objectAtIndex:(k)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                }
                
                k = k + 4;
            }
            
            lft = 0;
            while (lft <= 12) {
                
                //checking first column
                if ([[[tiles objectAtIndex:(lft+3)] text] isEqual:@""]) {
                    [[tiles objectAtIndex:(lft+3)] setText:[[tiles objectAtIndex:(lft+2)] text]];
                    [[tiles objectAtIndex:(lft+2)] setText:@""];
                    [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    addNum = true;
                }
                
                //checking 2nd column
                if([[[tiles objectAtIndex:(lft+2)] text] isEqual:@""])
                {
                    addNum = true;
                    if([[[tiles objectAtIndex:(lft+3)] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:(lft+3)] setText:[[tiles objectAtIndex:lft+1] text]];
                        [[tiles objectAtIndex:(lft+1)] setText:@""];
                        [[tiles objectAtIndex:(lft+1)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                    else
                    {
                        [[tiles objectAtIndex:(lft+2)] setText:[[tiles objectAtIndex:lft+1] text]];
                        [[tiles objectAtIndex:(lft+1)] setText:@""];
                        [[tiles objectAtIndex:(lft+1)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                }
                
                //checking 3rd column
                if([[[tiles objectAtIndex:(lft+1)] text] isEqual:@""])
                {
                    addNum = true;
                    if([[[tiles objectAtIndex:(lft+3)] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:(lft+3)] setText:[[tiles objectAtIndex:lft] text]];
                        [[tiles objectAtIndex:(lft)] setText:@""];
                        [[tiles objectAtIndex:(lft)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                    else if([[[tiles objectAtIndex:(lft+2)] text] isEqual:@""])
                    {
                        [[tiles objectAtIndex:(lft+2)] setText:[[tiles objectAtIndex:lft] text]];
                        [[tiles objectAtIndex:(lft)] setText:@""];
                        [[tiles objectAtIndex:(lft)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                    else
                    {
                        [[tiles objectAtIndex:(lft+1)] setText:[[tiles objectAtIndex:lft] text]];
                        [[tiles objectAtIndex:(lft)] setText:@""];
                        [[tiles objectAtIndex:(lft)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                    }
                }
                lft = lft + 4;
            }
            
            //adding a random 2
        
            [self generatingNum];
            
        
    }
    
    //swiping up
      if (sender.direction == UISwipeGestureRecognizerDirectionUp)
      {
          
              /*   Boolean flg = false;
               addNum = false;
               for(int uprtile = 0; uprtile < 12; uprtile++)
               {
               
               if ([[tiles objectAtIndex:uprtile] text] == [[tiles objectAtIndex:(uprtile+4)] text]) {
               //adding the numbers
               
               //bring the tiles upwards
               int k = 15;
               while (k>=4) {
               if([[[tiles objectAtIndex:(k-4)] text] isEqual:@""])
               {
               NSLog(@"Tiles == %@ %@",[[tiles objectAtIndex:(k-4)] text],[[tiles objectAtIndex:k] text]);
               [[tiles objectAtIndex:(k-4)] setText:[[tiles objectAtIndex:(k)] text]];
               [[tiles objectAtIndex:k] setText:@""];
               [[tiles objectAtIndex:k] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
               addNum = true;
               }
               k--;
               }
               
               //addition logic
               k = 0;
               while(k<=11)
               {
               if ([[tiles objectAtIndex:k] text] == [[tiles objectAtIndex:(k+4)] text]) {
               
               
               int m = [[[tiles objectAtIndex:k] text] intValue];
               int n = [[[tiles objectAtIndex:(k+4)] text] intValue];
               int res = m + n;
               
               if(res > 0)
               {
               
               int p = [scoreLabel.text intValue];
               int scr = p + res;
               [scoreLabel setText:[NSString stringWithFormat:@"%d",scr]];
               [[tiles objectAtIndex:k] setText :[NSString stringWithFormat:@"%d",res] ];
               
               //emptying the 2nd tile
               [[tiles objectAtIndex:(k+4)] setText:@""];
               [[tiles objectAtIndex:(k+4)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
               }
               }
               k++;
               }
               
               //bring the tiles upwards
               k = 15;
               while (k>=4) {
               if([[[tiles objectAtIndex:(k-4)] text] isEqual:@""])
               {
               [[tiles objectAtIndex:(k-4)] setText:[[tiles objectAtIndex:(k)] text]];
               [[tiles objectAtIndex:k] setText:@""];
               [[tiles objectAtIndex:k] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
               addNum = true;
               }
               k--;
               }
               
               
               //adding a random 2
               [self generatingNum];
               
               }
               if(flg)
               break;
               }
               
               
               */
              //Stage 1 - get all the location closer
              for (int j=0; j<=3; j++) {
                  //Boolean flag = false;
                  //this is for location 0,1,2,3
                  if([[[tiles objectAtIndex:j] text] isEqual:@""])
                  {
                      [[tiles objectAtIndex:j] setText: [[tiles objectAtIndex:(j+4)] text]];
                      [[tiles objectAtIndex:(j+4)] setText: @""];
                  }
                  
                  //this is for location 4,5,6,7
                  if([[[tiles objectAtIndex:j+4] text] isEqual:@""])
                  {
                      if([[[tiles objectAtIndex:j] text] isEqual:@""])
                      {
                          [[tiles objectAtIndex:j] setText: [[tiles objectAtIndex:(j+8)] text]];
                          [[tiles objectAtIndex:(j+8)] setText: @""];
                      }
                      else
                      {
                          [[tiles objectAtIndex:j+4] setText: [[tiles objectAtIndex:(j+8)] text]];
                          [[tiles objectAtIndex:(j+8)] setText: @""];
                      }
                      
                  }
                  
                  //this is for location 8,9,10,11
                  if([[[tiles objectAtIndex:j+8] text] isEqual:@""])
                  {
                      if([[[tiles objectAtIndex:j] text] isEqual:@""])
                      {
                          [[tiles objectAtIndex:j] setText: [[tiles objectAtIndex:(j+12)] text]];
                          [[tiles objectAtIndex:(j+12)] setText: @""];
                          
                      }
                      else if([[[tiles objectAtIndex:j+4] text] isEqual:@""])
                      {
                          [[tiles objectAtIndex:j+4] setText: [[tiles objectAtIndex:(j+12)] text]];
                          [[tiles objectAtIndex:(j+12)] setText: @""];
                      }
                      else
                      {
                          [[tiles objectAtIndex:j+8] setText: [[tiles objectAtIndex:(j+12)] text]];
                          [[tiles objectAtIndex:(j+12)] setText: @""];
                      }
                      
                  }
              }
              
              //Stage 2 - add consecutive numbers in pairs.
              int k = 0;
              while(k<=11)
              {
                  
                  if ([[[tiles objectAtIndex:k] text] isEqualToString:[[tiles objectAtIndex:(k+4)] text]]) {
                      int m = [[[tiles objectAtIndex:k] text] intValue];
                      int n = [[[tiles objectAtIndex:(k+4)] text] intValue];
                      int res = m + n;
                      if(res > 0)
                      {
                          //setting the added value
                          [[tiles objectAtIndex:k] setText :[NSString stringWithFormat:@"%d",res] ];
                          //emptying the 2nd tile
                          [[tiles objectAtIndex:(k+4)] setText:@""];
                          //calculating score
                          int p = [scoreLabel.text intValue];
                          int scr = p + res;
                          [scoreLabel setText:[NSString stringWithFormat:@"%d",scr]];
                          
                      }
                  }
                  k++;
              }
              
              
              //Stage 3 - move and remove empty space.
              for (int j=0; j<=3; j++) {
                  
                  //this is for location 0,1,2,3
                  if([[[tiles objectAtIndex:j] text] isEqual:@""])
                  {
                      [[tiles objectAtIndex:j] setText: [[tiles objectAtIndex:(j+4)] text]];
                      [[tiles objectAtIndex:(j+4)] setText: @""];
                      
                  }
                  
                  //this is for location 4,5,6,7
                  if([[[tiles objectAtIndex:j+4] text] isEqual:@""])
                  {
                      if([[[tiles objectAtIndex:j] text] isEqual:@""])
                      {
                          [[tiles objectAtIndex:j] setText: [[tiles objectAtIndex:(j+8)] text]];
                          [[tiles objectAtIndex:(j+8)] setText: @""];
                      }
                      else
                      {
                          [[tiles objectAtIndex:j+4] setText: [[tiles objectAtIndex:(j+8)] text]];
                          [[tiles objectAtIndex:(j+8)] setText: @""];
                      }
                      
                  }
                  
                  //this is for location 8,9,10,11
                  if([[[tiles objectAtIndex:j+8] text] isEqual:@""])
                  {
                      if([[[tiles objectAtIndex:j] text] isEqual:@""])
                      {
                          [[tiles objectAtIndex:j] setText: [[tiles objectAtIndex:(j+12)] text]];
                          [[tiles objectAtIndex:(j+12)] setText: @""];
                          
                      }
                      else if([[[tiles objectAtIndex:j+4] text] isEqual:@""])
                      {
                          [[tiles objectAtIndex:j+4] setText: [[tiles objectAtIndex:(j+12)] text]];
                          [[tiles objectAtIndex:(j+12)] setText: @""];
                      }
                      else
                      {
                          [[tiles objectAtIndex:j+8] setText: [[tiles objectAtIndex:(j+12)] text]];
                          [[tiles objectAtIndex:(j+12)] setText: @""];
                      }
                      
                  }
              }
              
              [self generatingNum];
          
      }
      if (sender.direction == UISwipeGestureRecognizerDirectionDown)
      {
          
              addNum = false;
              //making tiles go down
              for(int dwn = 0;dwn < 4 ; dwn++)
              {
                  //chking last row of columns
                  if ([[[tiles objectAtIndex:(dwn+12)] text] isEqual:@""]) {
                      [[tiles objectAtIndex:(dwn+12)] setText:[[tiles objectAtIndex:(dwn+8)] text]];
                      [[tiles objectAtIndex:(dwn+8)] setText:@""];
                      [[tiles objectAtIndex:(dwn+8)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                      addNum = true;
                  }
                  //checking 2nd last row of columns
                  if([[[tiles objectAtIndex:(dwn+8)] text] isEqual:@""])
                  {
                      if ([[[tiles objectAtIndex:(dwn+12)] text] isEqual:@""]) {
                          [[tiles objectAtIndex:(dwn+12)] setText:[[tiles objectAtIndex:(dwn+4)] text]];
                          [[tiles objectAtIndex:(dwn+4)] setText:@""];
                          [[tiles objectAtIndex:(dwn+4)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                      }
                      else
                      {
                          [[tiles objectAtIndex:(dwn+8)] setText:[[tiles objectAtIndex:(dwn+4)] text]];
                          [[tiles objectAtIndex:(dwn+4)] setText:@""];
                          [[tiles objectAtIndex:(dwn+4)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                          
                      }
                  }
                  //checking 2nd row of column
                  if([[[tiles objectAtIndex:(dwn+4)] text] isEqual:@""])
                  {
                      if ([[[tiles objectAtIndex:(dwn+12)] text] isEqual:@""]) {
                          [[tiles objectAtIndex:(dwn+12)] setText:[[tiles objectAtIndex:(dwn)] text]];
                          [[tiles objectAtIndex:(dwn)] setText:@""];
                          [[tiles objectAtIndex:(dwn)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                      }
                      else if ([[[tiles objectAtIndex:(dwn+8)] text] isEqual:@""])
                      {
                          [[tiles objectAtIndex:(dwn+8)] setText:[[tiles objectAtIndex:(dwn)] text]];
                          [[tiles objectAtIndex:(dwn)] setText:@""];
                          [[tiles objectAtIndex:(dwn)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                      }
                      else
                      {
                          [[tiles objectAtIndex:(dwn+4)] setText:[[tiles objectAtIndex:(dwn)] text]];
                          [[tiles objectAtIndex:(dwn)] setText:@""];
                          [[tiles objectAtIndex:(dwn)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                          
                      }
                  }
              }
              
              
              //addition logic
              int k = 15;
              while(k>=4)
              {
                  if ([[[tiles objectAtIndex:k] text] isEqualToString:[[tiles objectAtIndex:(k-4)] text]]) {
                      
                      
                      int m = [[[tiles objectAtIndex:k] text] intValue];
                      int n = [[[tiles objectAtIndex:(k-4)] text] intValue];
                      int res = m + n;
                      
                      if(res > 0)
                      {
                          
                          [[tiles objectAtIndex:k] setText :[NSString stringWithFormat:@"%d",res] ];
                          int p = [scoreLabel.text intValue];
                          int scr = p + res;
                          [scoreLabel setText:[NSString stringWithFormat:@"%d",scr]];
                          //emptying the 2nd tile
                          [[tiles objectAtIndex:(k-4)] setText:@""];
                          [[tiles objectAtIndex:(k-4)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                      }
                  }
                  k--;
              }
              
              
              //making tiles go down
              for(int dwn = 0;dwn < 4 ; dwn++)
              {
                  //chking last row of columns
                  if ([[[tiles objectAtIndex:(dwn+12)] text] isEqual:@""]) {
                      [[tiles objectAtIndex:(dwn+12)] setText:[[tiles objectAtIndex:(dwn+8)] text]];
                      [[tiles objectAtIndex:(dwn+8)] setText:@""];
                      [[tiles objectAtIndex:(dwn+8)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                      addNum = true;
                  }
                  //checking 2nd last row of columns
                  if([[[tiles objectAtIndex:(dwn+8)] text] isEqual:@""])
                  {
                      if ([[[tiles objectAtIndex:(dwn+12)] text] isEqual:@""]) {
                          [[tiles objectAtIndex:(dwn+12)] setText:[[tiles objectAtIndex:(dwn+4)] text]];
                          [[tiles objectAtIndex:(dwn+4)] setText:@""];
                          [[tiles objectAtIndex:(dwn+4)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                      }
                      else
                      {
                          [[tiles objectAtIndex:(dwn+8)] setText:[[tiles objectAtIndex:(dwn+4)] text]];
                          [[tiles objectAtIndex:(dwn+4)] setText:@""];
                          [[tiles objectAtIndex:(dwn+4)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                          
                      }
                  }
                  //checking 2nd row of column
                  if([[[tiles objectAtIndex:(dwn+4)] text] isEqual:@""])
                  {
                      if ([[[tiles objectAtIndex:(dwn+12)] text] isEqual:@""]) {
                          [[tiles objectAtIndex:(dwn+12)] setText:[[tiles objectAtIndex:(dwn)] text]];
                          [[tiles objectAtIndex:(dwn)] setText:@""];
                          [[tiles objectAtIndex:(dwn)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                      }
                      else if ([[[tiles objectAtIndex:(dwn+8)] text] isEqual:@""])
                      {
                          [[tiles objectAtIndex:(dwn+8)] setText:[[tiles objectAtIndex:(dwn)] text]];
                          [[tiles objectAtIndex:(dwn)] setText:@""];
                          [[tiles objectAtIndex:(dwn)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                      }
                      else
                      {
                          [[tiles objectAtIndex:(dwn+4)] setText:[[tiles objectAtIndex:(dwn)] text]];
                          [[tiles objectAtIndex:(dwn)] setText:@""];
                          [[tiles objectAtIndex:(dwn)] setBackgroundColor:[UIColor colorWithRed:(211/255.f) green:(211/255.f) blue:(211/255.f) alpha:1]];
                          addNum = true;
                          
                      }
                  }
              }
              
              //adding a random 2
              /*   for (int i = 0; i < 999; i++) {
               NSInteger randomNumber = arc4random() % 16;
               
               if ([[[tiles objectAtIndex:randomNumber] text]  isEqual: @""]) {
               
               [[tiles objectAtIndex:randomNumber] setText:@"2" ];
               // [[tiles objectAtIndex:randomNumber] setTextColor:[UIColor whiteColor]];
               [[tiles objectAtIndex:randomNumber] setBackgroundColor:[UIColor colorWithRed:(233/255.f) green:(138/255.f) blue:(36/255.f) alpha:1]];
               
               break;
               }
               
               
               }*/
              [self generatingNum];
              
          
      }
}



@end
