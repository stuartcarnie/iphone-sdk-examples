//
//  DebugSupport.m
//
//  Created by Stuart Carnie on 1/30/09.
//  Copyright 2009 Stuart Carnie. All rights reserved.
//

#import "DebugSupport.h"

@implementation DebugSupport

static DebugSupport *instance;

- (void)promptForDebugger {
	waiting = YES;
	NSString *prompt = [NSString stringWithFormat:@"Attach Debuger, PID %d", getpid()];
	UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Debug" message:prompt delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
	[view show];
	[view release];
	
	while(waiting) {
		CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.25, false);
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	waiting = NO;
}

+ (void)waitForDebugger {
	if (instance == nil) {
		instance = [[DebugSupport alloc] init];
	}
	[instance promptForDebugger];
}

@end
