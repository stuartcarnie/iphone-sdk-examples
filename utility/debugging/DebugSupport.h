//
//  DebugSupport.h
//  iC64
//
//  Created by Stuart Carnie on 1/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DebugSupport : NSObject<UIAlertViewDelegate> {
	BOOL waiting;
}

+ (void)waitForDebugger;

@end
