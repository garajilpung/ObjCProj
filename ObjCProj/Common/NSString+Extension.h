//
//  NSString+Extension.h
//  test
//
//  Created by suhyup02 on 17/12/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (extended)

// base64 Encoding
- (NSString*) getBase64Encoding;

// base64 Decoding
- (NSString*) getBase64Decoding;

// URL Encoding
- (NSString*) getURLEncoding;

// URL Decoding
- (NSString*) getURLDecoding;

// json to Dictionary
- (NSDictionary *) getDictionary:(NSError*)err;


- (void) displayURL;
@end

NS_ASSUME_NONNULL_END
