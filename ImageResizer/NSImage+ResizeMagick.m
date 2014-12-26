//
//  NSImage+ResizeMagick.m
//  ImageResizer
//
//  Created by Yang on 2014/12/26.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "NSImage+ResizeMagick.h"

@implementation NSImage (Magic)

- (NSImage *) resizedImageByMagic: (NSString *) spec
{
    NSArray *widthAndHeight = [spec componentsSeparatedByString: @"x"];
    if ([[widthAndHeight objectAtIndex: 1] isEqualToString: @""])
        return [self resizedImageByWidth: [spec integerValue]];
    
    if ([[widthAndHeight objectAtIndex: 0] isEqualToString: @""])
        return [self resizedImageByHeight: [[widthAndHeight objectAtIndex: 1] integerValue]];
    
    return [self resizedImageWithMaximumSize: CGSizeMake ([[widthAndHeight objectAtIndex: 0] integerValue],
                                                          [[widthAndHeight objectAtIndex: 1] integerValue])];
    
}

- (NSImage *)resizedImageWithScale:(CGFloat)scale
{
    NSSize scaledSize = NSMakeSize(floorf(self.size.width * scale), floorf(self.size.height * scale));
    return [self resizeBySize:scaledSize];
}

- (NSImage *) resizedImageByWidth: (NSUInteger) width
{
    CGFloat ratio = width/self.size.width;
    NSSize scaledSize = NSMakeSize(floorf(self.size.width * ratio), floorf(self.size.height * ratio));
    return [self resizeBySize:scaledSize];
}

- (NSImage *) resizedImageByHeight:  (NSUInteger) height
{
    CGFloat ratio = height/self.size.height;
    NSSize scaledSize = NSMakeSize(floorf(self.size.width * ratio), floorf(self.size.height * ratio));
    return [self resizeBySize:scaledSize];
}

- (NSImage *)resizedImageWithMinimumSize: (CGSize) size
{
    CGFloat width_ratio = size.width / self.size.width;
    CGFloat height_ratio = size.height / self.size.height;
    CGFloat scale_ratio = width_ratio > height_ratio ? width_ratio : height_ratio;
    return [self resizedImageWithScale:scale_ratio];
}

- (NSImage *)resizedImageWithMaximumSize: (CGSize) size
{
    CGFloat width_ratio = size.width / self.size.width;
    CGFloat height_ratio = size.height / self.size.height;
    CGFloat scale_ratio = width_ratio < height_ratio ? width_ratio : height_ratio;
    return [self resizedImageWithScale:scale_ratio];
}

-(NSImage*)resizeBySize:(CGSize)scaledSize
{
    NSBitmapImageRep *rep = self.representations.firstObject;
    rep = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL
                                                  pixelsWide:scaledSize.width
                                                  pixelsHigh:scaledSize.height
                                               bitsPerSample:8
                                             samplesPerPixel:4
                                                    hasAlpha:YES
                                                    isPlanar:NO
                                              colorSpaceName:rep.colorSpaceName
                                                 bytesPerRow:0
                                                bitsPerPixel:0];
    rep.size = scaledSize;
    
    [NSGraphicsContext saveGraphicsState];
    [NSGraphicsContext setCurrentContext:[NSGraphicsContext graphicsContextWithBitmapImageRep:rep]];
    [self drawInRect:NSMakeRect(0, 0, scaledSize.width, scaledSize.height)];
    [NSGraphicsContext restoreGraphicsState];
    
    return [[NSImage alloc] initWithData:[rep representationUsingType:NSPNGFileType properties:nil]];
}

- (BOOL)saveToFile:(NSString *)filePath withType:(NSBitmapImageFileType)type
{
    NSData *data = nil;
    if (type == NSTIFFFileType)
    {
        data = self.TIFFRepresentation;
    }
    else
    {
        NSBitmapImageRep *rep = [NSBitmapImageRep imageRepWithData:self.TIFFRepresentation];
        data = [rep representationUsingType:type properties:nil];
    }
    return [data writeToFile:filePath atomically:NO];
}
@end
