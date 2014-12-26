//
//  ResizeSettingVC.h
//  ImageResizer
//
//  Created by Yang on 2014/12/24.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSImage+ResizeMagick.h"

@interface ResizeSettingVC : NSViewController
{
    IBOutlet NSTextField *widthField;
    IBOutlet NSTextField *heightField;
}
@property (nonatomic,copy) NSString *imagePath;

@end

