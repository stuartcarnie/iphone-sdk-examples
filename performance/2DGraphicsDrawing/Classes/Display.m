//
//  Display.m
//  2DGraphicsDrawing
//
//  Created by Stuart Carnie on 12/3/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Display.h"
#import <QuartzCore/QuartzCore.h>

@interface Display(Private)

- (void)update;

@end

@implementation Display


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		
		producer = [[ImageProducer32bit alloc] init];
		[producer start];
		timer = [NSTimer scheduledTimerWithTimeInterval:(1 / 50.0) target:self selector:@selector(update) userInfo:nil repeats:YES];
    }
    return self;
}
		
- (void)update {
	if (producer->imageReady) {	
		CGImageRef image = [producer getImage];
		//CGRect r = CGRectMake(32, 35, 320, 217);
		//CGImageRef image = CGImageCreateWithImageInRect(baseImage, r);
		
		CALayer *layer = self.layer;
		layer.contents = (id)image;
		
		//CFRelease(image);
		[producer releaseImage:image];

		producer->imageReady = NO;	
	}
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
