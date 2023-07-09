//
//  KVOViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/03/08.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "KVOViewController.h"

@interface USER : NSObject 

@property (retain, nonatomic) NSString* strFirstName;
@property (retain, nonatomic) NSString* strLastName;

@property (assign, nonatomic) NSInteger nAge;
@end

@implementation USER

- (instancetype)init {
    self = [super init];
    if (self) {
        self.strFirstName = @"";
        self.strLastName = @"";
        self.nAge = 0;
    }
    return self;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"strLastName"]) {
        return NO;
    } else {
        return [super automaticallyNotifiesObserversForKey:key];
    }
}

@end

@interface KVOViewController () {
    USER *cUser;
}

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    cUser = [[USER alloc] init];

    
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    [cUser addObserver:self forKeyPath:@"strFirstName" options:NSKeyValueObservingOptionNew context:nil];
    [cUser addObserver:self forKeyPath:@"strLastName" options:NSKeyValueObservingOptionNew context:nil];
    [cUser addObserver:self forKeyPath:@"nAge" options:NSKeyValueObservingOptionNew context:nil];
    
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    
    [cUser removeObserver:self forKeyPath:@"strFirstName"];
    [cUser removeObserver:self forKeyPath:@"strLastName"];
    [cUser removeObserver:self forKeyPath:@"nAge"];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"strFirstName"]) {
        NSLog(@"change strFirstName %@", change);
    }
    
    if ([keyPath isEqualToString:@"strLastName"]) {
        NSLog(@"change strLastName %@", change);
    }
    
    if ([keyPath isEqualToString:@"nAge"]) {
        NSLog(@"change nAge %@", change);
    }
}

#pragma mark - UIButton Event

- (IBAction)onBtn1:(id)sender {
    cUser.strFirstName = @"vwss";
}

- (IBAction)onBtn2:(id)sender {
    cUser.strLastName = @"fffff";
}

- (IBAction)onBtn3:(id)sender {
    cUser.nAge = 80;
}
@end
