//
//  ResizeSettingVC.m
//  ImageResizer
//
//  Created by Yang on 2014/12/24.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "ResizeSettingVC.h"
#import "AppDelegate.h"
#import "SettingVC.h"

@implementation ResizeSettingVC

- (IBAction)buttonDidClick:(NSButton *)sender
{
    [self resizeImageByMagic:sender.title];
    
    AppDelegate *app = [NSApplication sharedApplication].delegate;
    [app.statusItemPopup hidePopover];
}

- (IBAction)customSizeButtonDidClick:(NSButton *)sender
{
    if (widthField.stringValue.length == 0 && heightField.stringValue.length == 0) return;
    
    [self resizeImageByMagic:[widthField.stringValue stringByAppendingFormat:@"x%@",heightField.stringValue]];
    
    AppDelegate *app = [NSApplication sharedApplication].delegate;
    [app.statusItemPopup hidePopover];
}

-(void)resizeImageByMagic:(NSString*)sizeString
{
    
    NSImage *raw = [[NSImage alloc] initWithData:[NSData dataWithContentsOfFile:self.imagePath]];
    NSString *imageName = [[self.imagePath lastPathComponent] stringByDeletingPathExtension];
    NSString *rootPath =  ([[NSUserDefaults standardUserDefaults] boolForKey:kUDSaveToDeskTopFlag]) ? [NSSearchPathForDirectoriesInDomains (NSDesktopDirectory, NSUserDomainMask, YES) objectAtIndex:0] :  [self.imagePath stringByDeletingLastPathComponent];
    
    NSArray *widthAndHeight = [sizeString componentsSeparatedByString: @"x"];
    NSUInteger width = [[widthAndHeight objectAtIndex: 0] isEqualToString: @""] ? 0 : [[widthAndHeight objectAtIndex: 0] integerValue];
    NSUInteger height = [[widthAndHeight objectAtIndex: 1] isEqualToString: @""] ? 0 : [[widthAndHeight objectAtIndex: 1] integerValue];
    
    //@3x
    [self resizeImage:raw bySize:CGSizeMake(width * 3, height * 3) saveTo:[rootPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@3x.png",imageName]]];
    //@2x
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kUDGenerateRetinaImage])
        [self resizeImage:raw bySize:CGSizeMake(width * 2, height * 2) saveTo:[rootPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@2x.png",imageName]]];
    //@1x
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kUDGenerateNomalImage])
        [self resizeImage:raw bySize:CGSizeMake(width, height) saveTo:[rootPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",imageName]]];
    
}

-(void)resizeImage:(NSImage*)raw bySize:(CGSize)size saveTo:(NSString*)path
{
    NSImage *scaledImage = [raw resizedImageWithMaximumSize:size];
    [scaledImage saveToFile:path withType:NSPNGFileType];
}


@end

