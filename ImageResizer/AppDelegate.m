//
//  AppDelegate.m
//  ImageResizer
//
//  Created by Yang on 2014/12/24.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "AppDelegate.h"
#import "AXStatusItemPopup.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [sb instantiateControllerWithIdentifier:@"Top"];
    self.statusItemPopup  = [[AXStatusItemPopup alloc] initWithViewController:vc image:[NSImage imageNamed:@"statusbar_icon"] alternateImage:[NSImage imageNamed:@"statusbar_icon"]];
    self.statusItemPopup.animated = 1;
    
    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:@"Preferences..." action:@selector(openSetting) keyEquivalent:@""];
    item.target = self;
    [self.statusItemPopup.rightClickMenu insertItem:item atIndex:0];
}

-(void)openSetting
{
    if (!self.settingWindow)
    {
        NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
        self.settingWindow = [sb instantiateControllerWithIdentifier:@"MyWindowController"];
    }
    
    [self.settingWindow showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
}

@end
