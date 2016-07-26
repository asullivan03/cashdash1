//
//  ViewController.h
//  CashDash
//
//  Created by Athenas Sullivan on 7/23/16.
//  Copyright © 2016 AirplaneMode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSCalendar *gregorianCalendar;
@property (strong, nonatomic) NSTimer *countDownTimer;
@property (strong, nonatomic) NSDateFormatter *countDownDateFormatter;
@property (strong, nonatomic) NSDate *countDownEndDate;
@property (strong, nonatomic) IBOutlet UILabel *lblCountDown;

@end

