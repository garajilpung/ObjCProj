//
//  FileManagerViewController.m
//  test
//
//  Created by suhyup02 on 2019. 3. 18..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "FileManagerViewController.h"

@interface FileManagerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbText;


@end

@implementation FileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
 
    [self loadResource];
    
    [self saveFile];
    [self loadFile];
    
    [self createDir];
    
    [self saveUserDefaults];
    [self loadUserDefaults];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void) loadResource{
 
    NSString *path = [[NSBundle mainBundle] pathForResource:@"app_download" ofType:@"txt"]; // 이것음 됨
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"app_download" ofType:@"txt" inDirectory:@"res/data"]; // 이건 안됨
    
    NSData* data = [NSData dataWithContentsOfFile:path];
    
    if(data == nil) {
        NSLog(@"data [%@]", @"데이터 없음");
    }else {
    
        NSString *content = [NSString stringWithCString:[data bytes] encoding:NSUTF8StringEncoding];
        
        NSLog(@"data [%@]", content);
        
        _lbText.text = content;
    }
}

- (void) saveFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/textfile.txt",
                          documentsDirectory];
    
    
    NSString *content = @"One\nTwo\nThree\nFour\nFive";
    BOOL ret = [content writeToFile:fileName
                         atomically:NO
                           encoding:NSUTF8StringEncoding
                              error:nil];
    
    if(ret) {
        NSLog(@"성공");
    }else {
        NSLog(@"실패");
    }
}

- (void) createDir {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePathAndDirectory = [documentsDirectory stringByAppendingPathComponent:@"/gh"];
    
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePathAndDirectory];
    if(fileExists) {
        NSLog(@"있다.");
    }else {
        NSLog(@"없다.");
    }
    
    
    NSError *error;
    
    if (![[NSFileManager defaultManager] createDirectoryAtPath:filePathAndDirectory
                                   withIntermediateDirectories:NO
                                                    attributes:nil
                                                         error:&error])
    {
        NSLog(@"Create directory error: %@", error);
    }else {
        
    }
}

- (void) loadFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/textfile.txt",
                          documentsDirectory];
    
    NSData* data = [NSData dataWithContentsOfFile:fileName];
    NSString* content = [NSString stringWithCString:data.bytes encoding:NSUTF8StringEncoding];
    
    NSLog(@"content %@", content);
}

- (void) saveUserDefaults {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:@"134-5232" forKey:@"Tel"];
    
    [user synchronize];
}

- (void) loadUserDefaults {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *data = [user objectForKey:@"Tel"];

    NSLog(@"data %@", data);
}
@end
