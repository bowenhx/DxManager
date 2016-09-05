//
//	 ______    ______    ______
//	/\  __ \  /\  ___\  /\  ___\
//	\ \  __<  \ \  __\_ \ \  __\_
//	 \ \_____\ \ \_____\ \ \_____\
//	  \/_____/  \/_____/  \/_____/
//
//
//	Copyright (c) 2014-2015, Geek Zoo Studio
//	http://www.bee-framework.com
//
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the "Software"),
//	to deal in the Software without restriction, including without limitation
//	the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//	IN THE SOFTWARE.
//

#ifdef __OBJC__

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import <objc/runtime.h>
#import <objc/message.h>
#import <CommonCrypto/CommonDigest.h>

#endif	// #ifdef __OBJC__


#pragma mark -

#undef	ALIAS
#define	ALIAS( __a, __b ) \
		__typeof__(__a) __b = __a;

#pragma mark -

#if !defined(__clang__) || __clang_major__ < 3

#ifndef __bridge
#define __bridge
#endif

#ifndef __bridge_retain
#define __bridge_retain
#endif

#ifndef __bridge_retained
#define __bridge_retained
#endif

#ifndef __autoreleasing
#define __autoreleasing
#endif

#ifndef __strong
#define __strong
#endif

#ifndef __unsafe_unretained
#define __unsafe_unretained
#endif

#ifndef __weak
#define __weak
#endif

#endif

#if __has_feature(objc_arc)

#define BEE_PROP_RETAIN					strong
#define BEE_PROP_ASSIGN					assign

#define BEE_RETAIN( x )					(x)
#define BEE_RELEASE( x )				(x)
#define BEE_AUTORELEASE( x )			(x)

#define BEE_BLOCK_COPY( x )				(x)
#define BEE_BLOCK_RELEASE( x )			(x)
#define BEE_SUPER_DEALLOC()

#define BEE_AUTORELEASE_POOL_START()	@autoreleasepool {
#define BEE_AUTORELEASE_POOL_END()		}

#else

#define BEE_PROP_RETAIN					retain
#define BEE_PROP_ASSIGN					assign

#define BEE_RETAIN( x )					[(x) retain]
#define BEE_RELEASE( x )				[(x) release]
#define BEE_AUTORELEASE( x )			[(x) autorelease]

#define BEE_BLOCK_COPY( x )				Block_copy( x )
#define BEE_BLOCK_RELEASE( x )			Block_release( x )
#define BEE_SUPER_DEALLOC()				[super dealloc]

#define BEE_AUTORELEASE_POOL_START()	NSAutoreleasePool * __pool = [[NSAutoreleasePool alloc] init];
#define BEE_AUTORELEASE_POOL_END()		[__pool release];

#endif

#undef	BEE_DEPRECATED
#define	BEE_DEPRECATED	__attribute__((deprecated))

#undef	BEE_EXTERN
#if defined(__cplusplus)
#define BEE_EXTERN		extern "C"
#else	// #if defined(__cplusplus)
#define BEE_EXTERN		extern
#endif	// #if defined(__cplusplus)

#pragma mark -


#ifndef	weakify
#if __has_feature(objc_arc)
#define weakify( x )	autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x;
#else	// #if __has_feature(objc_arc)
#define weakify( x )	autoreleasepool{} __block __typeof__(x) __block_##x##__ = x;
#endif	// #if __has_feature(objc_arc)
#endif	// #ifndef	weakify

#ifndef	normalize
#if __has_feature(objc_arc)
#define normalize( x )	try{} @finally{} __typeof__(x) x = __weak_##x##__;
#else	// #if __has_feature(objc_arc)
#define normalize( x )	try{} @finally{} __typeof__(x) x = __block_##x##__;
#endif	// #if __has_feature(objc_arc)
#endif	// #ifndef	@normalize

#pragma mark -

// ----------------------------------
// Preload headers
// ----------------------------------

