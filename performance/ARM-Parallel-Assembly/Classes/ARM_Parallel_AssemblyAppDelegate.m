//
//  ARM_Parallel_AssemblyAppDelegate.m
//  ARM-Parallel-Assembly
//
//  Created by Stuart Carnie on 11/26/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "ARM_Parallel_AssemblyAppDelegate.h"

@implementation ARM_Parallel_AssemblyAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
