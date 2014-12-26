//
//  ViewController.m
//  ImageResizer
//
//  Created by Yang on 2014/12/24.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "ViewController.h"
#import "AXStatusItemPopup.h"
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dragDropView.allowFileExtensions = @[@"png"];
}

-(void)dragDropView:(DragDropView *)dView getItemPath:(NSString *)path
{
    imagePath = path;
    [self performSegueWithIdentifier:@"showResize" sender:self];
}

-(void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showResize"])
    {
        ResizeSettingVC *vc = (ResizeSettingVC*)segue.destinationController;
        vc.imagePath = imagePath;
    }
}

@end
