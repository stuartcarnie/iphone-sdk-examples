/*
 *  process.c
 *  ARM-Parallel-Assembly
 *
 *  Created by Stuart Carnie on 11/26/08.
 *  Copyright 2008 __MyCompanyName__. All rights reserved.
 *
 */

#include "process.h"

#if TARGET_IPHONE_SIMULATOR

void process_image(unsigned char* buf, unsigned int size) {
	const unsigned int val = 0x01010100;
	
	do {
		*buf++ += 1;
		*buf++ += 1;
		*buf++ += 1;
		*buf &= val;
	} while (--size);
}

#endif