/*
 * Copyright (c) 2007, 2008 Stuart Carnie
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the <organization> nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY Stuart Carnie ''AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL Stuart Carnie BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
 */

#include "CocoaUtility.h"

@implementation UIImage(Loading)

+ (UIImage*)imageFromResource:(NSString*)resourceName {
	NSData *imageData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:resourceName 
																							   ofType:nil]];
	UIImage *image = [UIImage imageWithData:imageData];
	[imageData release];
	return image;
}

@end

@implementation UIImageView(UIImageHelpers)

+ (UIImageView*)newViewFromImageResource:(NSString*)resourceName {
	NSData *imageData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:resourceName 
																							   ofType:nil]];
	UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageWithData:imageData]];
	[imageData release];
	return view;	
}

@end

@implementation NSString(URLEncoding)

- (NSString *)encodeForURL {
	NSString *reserved = @":/?#[]@!$&'()*+;=";
    return [NSMakeCollectable(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, (CFStringRef)reserved, kCFStringEncodingUTF8)) autorelease];
}

- (NSString *) decodeFromURL {
	return [NSMakeCollectable(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, (CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8)) autorelease];
}

@end

@implementation UIButton(ButtonHelpers)

+ (UIButton*)newButtonWithImage:(NSString*)imageName andSelectedImage:(NSString*)selectedImageName {
	UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
	UIImage *image = [UIImage imageFromResource:imageName];
	view.frame = CGRectMake(0, 0, image.size.width, image.size.height);
	[view setImage:image forState:UIControlStateNormal];
	if (selectedImageName)
		[view setImage:[UIImage imageFromResource:selectedImageName] forState:UIControlStateSelected];
	return view;
}

- (void)setImage:(UIImage*)image forStates:(UIControlState)states {
	[self setImage:image forState:UIControlStateNormal];
	
	if (states & UIControlStateHighlighted)
		[self setImage:image forState:UIControlStateHighlighted];
	if (states & UIControlStateDisabled)
		[self setImage:image forState:UIControlStateDisabled];
	if (states & UIControlStateSelected)
		[self setImage:image forState:UIControlStateSelected];
}

@end
