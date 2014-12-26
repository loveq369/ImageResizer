//
//  NSImage+ResizeMagick.h
//  ImageResizer
//
//  Created by Yang on 2014/12/26.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (Magic)
- (NSImage *)resizedImageWithScale:(CGFloat)scale;
- (BOOL)saveToFile:(NSString *)filePath withType:(NSBitmapImageFileType)type;

- (NSImage *) resizedImageByMagic: (NSString *) spec;
- (NSImage *) resizedImageByWidth: (NSUInteger) width;
- (NSImage *) resizedImageByHeight:  (NSUInteger) height;
- (NSImage *)resizedImageWithMinimumSize: (CGSize) size;
- (NSImage *)resizedImageWithMaximumSize: (CGSize) size;

@end
