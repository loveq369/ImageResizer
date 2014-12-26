//
//  SettingVC.m
//  ImageResizer
//
//  Created by Yang on 2014/12/26.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "SettingVC.h"

@implementation SettingVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    retinaButton.state = [[NSUserDefaults standardUserDefaults] boolForKey:kUDGenerateRetinaImage] ? NSOnState : NSOffState;
    normalButton.state = [[NSUserDefaults standardUserDefaults] boolForKey:kUDGenerateNomalImage] ? NSOnState : NSOffState;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kUDSaveToDeskTopFlag]) [saveToDesktopRadio selectCellAtRow:1 column:0];
}

- (IBAction)retinaRadioValueDidChanged:(NSButton *)sender
{
    [[NSUserDefaults standardUserDefaults] setBool: (sender.state == NSOnState) ? 1 : 0 forKey:kUDGenerateRetinaImage];
}

- (IBAction)normalRadioValueDidChanged:(NSButton *)sender
{
    [[NSUserDefaults standardUserDefaults] setBool: (sender.state == NSOnState) ? 1 : 0 forKey:kUDGenerateRetinaImage];
}

- (IBAction)saveToDesktopValueDidChanged:(NSMatrix *)sender
{
    [[NSUserDefaults standardUserDefaults] setBool: (sender.selectedRow == 0) ? 0 : 1 forKey:kUDSaveToDeskTopFlag];
}


@end
