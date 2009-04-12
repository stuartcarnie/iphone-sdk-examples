//
//  main.m
//  ARM-Parallel-Assembly
//
//  Created by Stuart Carnie on 11/26/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "process.h"

typedef unsigned char uint8;

int main(int argc, char *argv[]) {
    const size_t count = 320*480*4;
	const int iterations = 100;
	
	uint8 *buf = calloc(count, 1);
	
	CFTimeInterval base_time = CFAbsoluteTimeGetCurrent();
	printf("Starting..., buf=%#x\r\n", *(uint*)buf);
	
	CFTimeInterval start_time = CFAbsoluteTimeGetCurrent();
	for (int i = 0; i < iterations; i++) {
		process_image(buf, count);	
	}
	
	CFTimeInterval total_time = (CFAbsoluteTimeGetCurrent() - start_time) * 1000.0;
	
	double ms_per_frame = total_time / (double)iterations;
	double fps = 1000.0 / ms_per_frame;
	double bytes_per_second = fps * (double)count;
	
	printf("total time: %fms, per iteration: %fms, fps: %f, bytes / sec: %f, buf=%#x\r\n", 
		   total_time, 
		   ms_per_frame, 
		   fps,
		   bytes_per_second,
		   *(uint*)buf);
	
    //NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    //int retVal = UIApplicationMain(argc, argv, nil, nil);
    //[pool release];
    return 0;
}
