//
//  prefix.h
//  ObjCProj
//
//  Created by garajilpung on 16/02/2020.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#ifndef prefix_h
#define prefix_h

#ifdef __OBJC__
#import "Utility.h"
#import "CommonDefine.h"
#endif

#ifdef Release
#define NSLog( s, ... )
#else
#define NSLog( s, ... ) NSLog( @"IPHONE TEST : <%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#endif

#endif /* prefix_h */
