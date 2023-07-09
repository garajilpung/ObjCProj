//
//  Person.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/03/12.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id) init {
    self = [super init];
    
    if(self) {
        _lastName = @"";
        _firstName = @"";
        _nAge = 0;
        _bStudent = false;
    }
    
    return self;
}

- (id) init:(NSDictionary*) dic {
    self = [super init];
    
    if(self) {
        for(NSString *key in dic.allKeys) {
            [self setValue:dic[key] forKey:key];
        }
        
    }
    
    return self;
}

- (void) desc {
    NSLog(@"lastName %@ ", _lastName);
    NSLog(@"firstName %@ ", _firstName);
    NSLog(@"Age %ld ", (long)_nAge);
    NSLog(@"Student %d ", _bStudent);
    NSLog(@"toy %@ ", _toy);
}
@end
