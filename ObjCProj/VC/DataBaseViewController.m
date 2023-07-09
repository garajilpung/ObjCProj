//
//  DataBaseViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/01/22.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "DataBaseViewController.h"
#import <sqlite3.h>

@interface DataBaseViewController ()

@end

@implementation DataBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSString *databasePath = @"./test001.sqlite";
    
    sqlite3 *database = nil;
    sqlite3_stmt *databaseStatement = nil;
    NSString *databaseQuery = nil;
    char *databaseMessage = nil;
    
    
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK){
        NSLog(@"Success Oepn");
        
        databaseQuery = @"CREATE TABLE IF NOT EXISTS 'Table1'('index', INTEGER PRIMARY KEY, 'value' TEXT);";
        
        if(sqlite3_exec(database, [databaseQuery UTF8String], NULL, NULL, &databaseMessage) == SQLITE_OK){
            NSLog(@"Success Create");
        }else {
            NSLog(@"Fail Create");
        }
        
        databaseQuery = @"INSERT INTO 'Table1'('value') VALUES ('Hello, World!');";
        
        if(sqlite3_exec(database, [databaseQuery UTF8String], NULL, NULL, &databaseMessage) == SQLITE_OK){
            NSLog(@"Success Insert");
        }else {
            NSLog(@"Fail Insert");
        }
        
        sqlite3_close(database);
        database = nil;
    }else {
        NSLog(@"Fail Open");
        sqlite3_close(database);
        database = nil;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
