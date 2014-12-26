//
//  SettingVC.h
//  ImageResizer
//
//  Created by Yang on 2014/12/26.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#define kUDGenerateRetinaImage @"kUDGenerateRetinaImage"
#define kUDGenerateNomalImage @"kUDGenerateNomalImage"
#define kUDSaveToDeskTopFlag @"kUDSaveToDeskTopFlag"


#import <Cocoa/Cocoa.h>

@interface SettingVC : NSViewController
{
    IBOutlet NSButton *retinaButton;
    IBOutlet NSButton *normalButton;
    IBOutlet NSMatrix *saveToDesktopRadio;
    
}
@end
