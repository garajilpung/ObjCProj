//
//  NSString+Extension.m
//  test
//
//  Created by suhyup02 on 17/12/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Extension.h"

@implementation NSString (extended)

/*
 URL encoding 관련 처리 결과
 
 URL 문법 <scheme>://<user-name>:<passowrd>@<host>:<port>/<path>;<params>?<query>#<fragment>
 
 url                                        plainString ~`1234567890!@#$%^&*()-=_+\|abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[];',./{}:<>?
 url stringByAddingPercentEscapesUsingEncoding encoding ~%601234567890!@%23$%25%5E&*()-=_+%5C%7CabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5D;',./%7B%7D:%3C%3E?
 stringByAddingPercentEncodingWithAllowedCharacters
 url URLFragmentAllowedCharacterSet            encoding ~%601234567890!@%23$%25%5E&*()-=_+%5C%7CabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5D;',./%7B%7D:%3C%3E?
 url URLHostAllowedCharacterSet                encoding ~%601234567890!%40%23$%25%5E&*()-=_+%5C%7CabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5D;',.%2F%7B%7D%3A%3C%3E%3F
 url URLPasswordAllowedCharacterSet            encoding ~%601234567890!%40%23$%25%5E&*()-=_+%5C%7CabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5D;',.%2F%7B%7D%3A%3C%3E%3F
 url URLPathAllowedCharacterSet                encoding ~%601234567890!@%23$%25%5E&*()-=_+%5C%7CabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5D%3B',./%7B%7D:%3C%3E%3F
 url URLQueryAllowedCharacterSet               encoding ~%601234567890!@%23$%25%5E&*()-=_+%5C%7CabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5D;',./%7B%7D:%3C%3E?
 url URLUserAllowedCharacterSet                encoding ~%601234567890!%40%23$%25%5E&*()-=_+%5C%7CabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5D;',.%2F%7B%7D%3A%3C%3E%3F
 
 */


// base64 Encoding
- (NSString*) getBase64Encoding {
    NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *ret = [plainData base64EncodedStringWithOptions:0];
    
    return ret;
}

// base64 Decoding
- (NSString*) getBase64Decoding {
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    NSString *ret = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    
    return ret;
}

//URL en,de Test { }
- (void) displayURL {
    // <scheme>://<user-name>:<passowrd>@<host>:<port>/<path>;<params>?<query>#<fragment>
    
    NSString *ss = @"https://id_1234!!:s8dkvi@#$%@garajilpung.synology.me:99/<path>;<param>?<query>#<fragment>";
    
    NSString* ret = [ss stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSLog(@"Ret %@", ret);
    
    ret = [ss stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPasswordAllowedCharacterSet]];
    NSLog(@"Ret %@", ret);
    
    ret = [ss stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    NSLog(@"Ret %@", ret);
    
    ret = [ss stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"Ret %@", ret);
    
    ret = [ss stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
    NSLog(@"Ret %@", ret);
    
    ret = [ss stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSLog(@"Ret %@", ret);
}


// URL Encoding
- (NSString*) getURLEncoding {
    // URLHostAllowedCharacterSet
    // URLPasswordAllowedCharacterSet
    // URLPathAllowedCharacterSet
    // URLQueryAllowedCharacterSet
    // URLUserAllowedCharacterSet
    // URLFragmentAllowedCharacterSet
        
    NSCharacterSet *set = [NSCharacterSet URLHostAllowedCharacterSet];
    NSString *ret = [self stringByAddingPercentEncodingWithAllowedCharacters:set];
    
    return ret;
}

// URL Decoding
- (NSString*) getURLDecoding {
    NSString *ret = [self stringByRemovingPercentEncoding];
    
    return ret;
}

// json to Dictionary
- (NSDictionary *) getDictionary:(NSError*)err {
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *ret = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
    
    return ret;
}
@end
