//
//  DragDropView.m
//  IPAdistribution
//
//  Created by Yang on 2014/05/28.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "DragDropView.h"

@implementation DragDropView

-(BOOL)allowsVibrancy
{
    return 1;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
        [self registerForDraggedTypes:[NSArray arrayWithObject:NSFilenamesPboardType]];
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
        [self registerForDraggedTypes:[NSArray arrayWithObject:NSFilenamesPboardType]];
    return  self;
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender
{
    highlight = YES;
    [self setNeedsDisplay: YES];
    return NSDragOperationGeneric;
}

- (void)draggingExited:(id <NSDraggingInfo>)sender
{
    highlight = NO;
    [self setNeedsDisplay: YES];
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender
{
    highlight = NO;
    [self setNeedsDisplay: YES];
    return YES;
}

- (BOOL)performDragOperation:(id < NSDraggingInfo >)sender
{
    NSArray *draggedFilenames = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    if (self.allowFileExtensions)
    {
        NSString *extension = [[draggedFilenames objectAtIndex:0] pathExtension];
        if ([self.allowFileExtensions indexOfObject:extension] != NSNotFound)
        {
            return YES;
        }
    }
    return NO;
}

- (void)concludeDragOperation:(id <NSDraggingInfo>)sender
{
    NSArray *draggedFilenames = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    if ([draggedFilenames firstObject])
    {
        if ([self.delegate respondsToSelector:@selector(dragDropView:getItemPath:)])
        {
            [self.delegate dragDropView:self getItemPath:[draggedFilenames firstObject]];
        }
    }
}

- (void)drawRect:(NSRect)rect
{
    NSBezierPath *p = [NSBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 10, 10) xRadius:10 yRadius:10];
    p.lineWidth = highlight ? 5 : 2;
    if (highlight)
        [[NSColor colorWithCalibratedRed:0.000 green:0.502 blue:1.000 alpha:1.000] set];
    else
        [[NSColor secondaryLabelColor] set];
    [p stroke];
}

@end
