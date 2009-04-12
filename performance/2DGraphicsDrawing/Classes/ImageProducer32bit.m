//
//  ImageProducer32bit.m
//  2DGraphicsDrawing
//
//  Created by Stuart Carnie on 12/3/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "ImageProducer32bit.h"
#include <string.h>

@implementation ImageProducer32bit

@synthesize running;

#if defined(MODE_16_BITS)
const int kBytesPerPixel	= 2;
const int kBitsPerComponent	= 5;
const unsigned int kFormat			= kCGBitmapByteOrder16Little | kCGImageAlphaNoneSkipFirst;
#else
const int kBytesPerPixel	= 4;
const int kBitsPerComponent	= 8;
const unsigned int kFormat			= kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst;
#endif

- (id)init {
	self = [super init];
	
	// create indexed color palette
	CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
	
	pixels = (uint*)malloc(DISPLAY_X * DISPLAY_Y * kBytesPerPixel);
	context = CGBitmapContextCreate(pixels, 
									DISPLAY_X, DISPLAY_Y, kBitsPerComponent, 
									DISPLAY_X * kBytesPerPixel, rgbColorSpace, kFormat);
	
	CGColorSpaceRelease(rgbColorSpace);
	
	return self;
}

- (void)dealloc {
	free(pixels);
	[super dealloc];
}

- (void)execute {
	running = YES;
	char col = 0;
	
#if defined(MODE_16_BITS)
	while (running) {
		int size	= (DISPLAY_X * 50) >> 1;
		int start	= (DISPLAY_X * 100) >> 1;
		
		col += 1;
		col &= 0x1f;
		ushort pix = col << 10 | col << 5 | col;
		uint pixel = pix << 16 | pix;
		uint *p = pixels + start;
		
		do {
			*p = pixel; p++;
		} while (--size);
		
		imageReady = YES;
		while (imageReady) {
			usleep(1 / 100.0 * 1000000);
		}
	}
#else
	while (running) {
		int size = DISPLAY_X * 50;
		uint *p = pixels + (DISPLAY_X * 100);
			
		col+= 10;
		uint pixel = 255 << 24 | col << 16 | col << 8 | col;
		
		do {
			*p = pixel; p++;
		} while (--size);
		
		imageReady = YES;
		while (imageReady) {
			usleep(1 / 100.0 * 1000000);
		}
	}
#endif
}

- (void)start {
	[self performSelectorInBackground:@selector(execute) withObject:nil];
}

- (CGImageRef)getImage {
	return CGBitmapContextCreateImage(context);
}

- (void)releaseImage:(CGImageRef)_image {
	CFRelease(_image);
}

@end
