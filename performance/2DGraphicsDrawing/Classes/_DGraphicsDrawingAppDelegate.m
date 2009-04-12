//
//  _DGraphicsDrawingAppDelegate.m
//  2DGraphicsDrawing
//
//  Created by Stuart Carnie on 12/3/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "_DGraphicsDrawingAppDelegate.h"
#import "Display.h"

@implementation _DGraphicsDrawingAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	Display *view = [[Display alloc] initWithFrame:CGRectMake(-32, -35, 0x180, 0x110)];
	
	[window addSubview:view];
	[view release];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
