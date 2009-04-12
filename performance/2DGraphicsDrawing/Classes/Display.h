//
//  Display.h
//  2DGraphicsDrawing
//
//  Created by Stuart Carnie on 12/3/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageProducer32bit.h"

@interface Display : UIView {
	ImageProducer32bit	*producer;
	NSTimer			*timer;
}

@end
