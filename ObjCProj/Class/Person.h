//
//  Person.h
//  ObjCProj
//
//  Created by suhyup02 on 2021/03/12.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, retain)NSString *lastName;
@property (nonatomic, retain)NSString *firstName;
@property (nonatomic, assign)NSInteger nAge;
@property (nonatomic, assign)BOOL bStudent;
@property (nonatomic, retain)NSArray *toy;

- (id) init:(NSDictionary*) dic;
- (void) desc;
@end

NS_ASSUME_NONNULL_END
