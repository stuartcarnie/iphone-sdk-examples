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

@interface UIImage(Loading)

+ (UIImage*)imageFromResource:(NSString*)name;

@end

@interface UIImageView(UIImageHelpers)

+ (UIImageView*)newViewFromImageResource:(NSString*)resourceName;

@end

@interface UIButton(ButtonHelpers)

//! Creates a new UIButton with the specified imageName and selectedImageName.  If selectedImageName is
//  nil, it is not used.
+ (UIButton*)newButtonWithImage:(NSString*)imageName andSelectedImage:(NSString*)selectedImageName;
- (void)setImage:(UIImage*)image forStates:(UIControlState)states;

@end

@interface NSString(URLEncoding)

- (NSString *)encodeForURL;
- (NSString *)decodeFromURL;

@end

@interface NSString(CStringUtility)


@end
