//
//  AppDelegate.h
//  ImageResizer
//
//  Created by Yang on 2014/12/24.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AXStatusItemPopup.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic,strong) AXStatusItemPopup * statusItemPopup;
@property (nonatomic,strong) NSWindowController *settingWindow;
@end

