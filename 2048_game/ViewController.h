//
//  ViewController.h
//  2048_game
//
//  Created by Pranav Bhandari on 2/4/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>
int randomNumber;
NSInteger num;
Boolean addNum = false;
@interface ViewController : UIViewController

@property(strong,nonatomic) IBOutletCollection(UILabel) NSArray *tiles;


@property(strong,nonatomic) UIButton *restart;
@property (strong, nonatomic) UILabel *scoreLabel;
@property (strong, nonatomic) UILabel *score;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *upSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *downSwipeGestureRecognizer;
@property (strong, nonatomic) UILabel *lb1;
@property (strong, nonatomic) UILabel *name;

@end

