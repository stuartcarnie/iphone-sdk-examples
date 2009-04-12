//
//  ImageProducer32bit.h
//  2DGraphicsDrawing
//
//  Created by Stuart Carnie on 12/3/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DISPLAY_X		0x180
#define DISPLAY_Y		0x110

#define MODE_16_BITS

@interface ImageProducer32bit : NSObject {
	BOOL				running;
	uint				*pixels;
	CGContextRef		context;
	CGImageRef			image;
	
@public
	BOOL				imageReady;
}

@property (nonatomic)	BOOL		running;

- (void)start;
- (CGImageRef)getImage;
- (void)releaseImage:(CGImageRef)image;

@end
