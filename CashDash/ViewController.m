//
//  ViewController.m
//  CashDash
//
//  Created by Athenas Sullivan on 7/23/16.
//  Copyright © 2016 AirplaneMode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // instantiate a calendar object.
    _gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //set countdown end date from db
    // Initialize date components with date values
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:2016];
    [dateComponents setMonth:8];
    [dateComponents setDay:25];
    [dateComponents setHour:12];
    [dateComponents setMinute:0];
    
    NSCalendar *calendar = [[NSCalendar alloc]  initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *configuredDate = [calendar dateFromComponents:dateComponents];
    _countDownEndDate = configuredDate;
    
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateClock:) userInfo:nil repeats:YES];
    [_countDownTimer fire];
}

-(void)updateClock:(NSTimer *)timer
{
    _countDownDateFormatter = [[NSDateFormatter alloc] init];
    [_countDownDateFormatter setDateFormat:@"DD:hh:mm:ss"];
    
    NSDate *now = [NSDate date];
    
    NSDateComponents *comp = [_gregorianCalendar components:NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond
                                                  fromDate:now
                                                    toDate:_countDownEndDate
                                                   options:0];
    
    NSString *strTimeRemaining = nil;
    
    // if date have not expired
    if([now compare:_countDownEndDate] == NSOrderedAscending)
    {
        strTimeRemaining = [[NSString alloc] initWithFormat:@"%02ldD: %02ldH: %02ldM: %02ldS",(long)[comp day], (long)[comp hour],  (long)[comp minute], (long)[comp second]];
    }
    else
    {
        // time has expired, set time to 00:00 and set boolean flag to no
        strTimeRemaining = @"00:00:00:00";
        
        [_countDownTimer invalidate];
        _countDownTimer = nil;
    }
    
    _lblCountDown.text = strTimeRemaining;
    
    //[_countDownDateFormatter release];
    //[strTimeRemaining release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
