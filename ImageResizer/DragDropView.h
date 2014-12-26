//
//  DragDropView.h
//  IPAdistribution
//
//  Created by Yang on 2014/05/28.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DragDropView;
@protocol DragDropViewDelegate <NSObject>
@optional
-(void)dragDropView:(DragDropView*)dView getItemPath:(NSString*)itemPath;
@end

IB_DESIGNABLE
@interface DragDropView : NSView
{
    BOOL highlight;
}

@property (nonatomic, strong) IBOutlet id <DragDropViewDelegate> delegate;
@property (nonatomic,copy) NSArray *allowFileExtensions;
@end
