//
//  ViewController.h
//  ImageResizer
//
//  Created by Yang on 2014/12/24.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DragDropView.h"
#import "ResizeSettingVC.h"

@interface ViewController : NSViewController <DragDropViewDelegate>
{
    IBOutlet DragDropView *dragDropView;
    NSString *imagePath;
}

@end

