//
//  HttpConnectionViewController.m
//  test
//
//  Created by suhyup02 on 27/06/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import "HttpConnectionViewController.h"
#import "NSString+Extension.h"
#import <AFNetworking/AFNetworking.h>

@interface HttpConnectionViewController ()

@end

@implementation HttpConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self sendJohoi];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBtnJohoi:(id)sender {
    [self sendJohoi];
}

- (IBAction)onBtnSend3:(id)sender {
    NSDictionary *dic = @{@"os":@"i",
    //                          @"id":@"케이에스오에스73",
                              @"id":@"ksos73",
                              @"regTime":@"vcsfb345g"};
    
    [self sendPost3:@"https://garajilpung.synology.me/php/fileupload.php" withData:dic];
}

- (IBAction)onBtnAFNetworkPost:(id)sender {
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyyMMddhhmmss"];
    NSString *regDate = [formatter stringFromDate:date];
    
//    NSString *URLString = @"https://garajilpung.synology.me/php/fileupload.php";
    NSString *URLString = @"http://192.168.1.103/php/post.php";
    NSDictionary *parameters = @{@"os":@"i",
                                 @"id":@"ksos73",
                                 @"regTime":regDate};
    

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    NSLog(@"url %@", request.URL.absoluteString);
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                   uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
                                                       
                                                    }
                                                 downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
                                                 } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                                        if (error) {
                                                            NSLog(@"Error: %@", error);
                                                        } else {
                                                            NSLog(@"%@ ", responseObject);
                                                            
                                                        }
                                                }];
    [dataTask resume];
    
}

- (IBAction)onBtnAFNetworkGet:(id)sender {
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyyMMddhhmmss"];
    NSString *regDate = [formatter stringFromDate:date];
    
    NSString *URLString = @"http://192.168.1.103/php/get.php";
    NSDictionary *parameters = @{@"os":@"i", @"id":@"ksos73", @"regTime":regDate};
        
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments]  ;

    NSLog(@"url %@", request.URL.absoluteString);
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                   uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
                                                       
                                                   }
                                                 downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
                                                     
                                                 } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                                     if (error) {
                                                         NSLog(@"Error: %@", error);
                                                     } else {
                                                         NSLog(@"%@", responseObject);
                                                         
                                                     }
                                                 }];
    [dataTask resume];
}

- (void)sendJohoi {
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyyMMddhhmmss"];
    NSString *regDate = [formatter stringFromDate:date];
    NSLog(@"regDate : %@", regDate);
    
    NSDictionary *dic = @{@"os":@"i",
//                          @"id":@"케이에스오에스73",
                          @"id":@"ksos73",
                          @"regTime":regDate};
    
//    [self sendPost:@"https://garajilpung.synology.me/php/post.php" withData:dic];
//    [self sendGet:@"https://garajilpung.synology.me/php/get.php" withData:dic];
    
    [self sendPost:@"http://192.168.1.103/php/post.php" withData:dic];
    [self sendGet:@"http://192.168.1.103/php/get.php" withData:dic];
}

- (NSString*) sendPost3:(NSString*)pURL withData:(NSDictionary*)pDic {
    __block NSString *ret = nil;
    
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    // request URL 설정
    NSURL *url = url = [NSURL URLWithString: pURL];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    // the boundary string : a random string, that will not repeat in post data, to separate post data fields.
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    
    // set Content-Type in HTTP header
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
    [urlRequest setValue:contentType forHTTPHeaderField: @"Content-Type"];

    // post body
    NSMutableData *body = [NSMutableData data];

    // add params (all params are strings)
    for (NSString *param in pDic) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [pDic objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }

    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.txt\"\r\n", @"file"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithString:@"Content-Type: image/jpeg\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"vvvvv" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];

    // add image data
//    NSData *imageData = UIImageJPEGRepresentation(imageToPost, 1.0);
//    if (imageData) {
//        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", FileParamConstant] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithString:@"Content-Type: image/jpeg\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:imageData];
//        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    }

    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];

    // setting the body of the post to the reqeust
    [urlRequest setHTTPBody:body];

    // set the content-length
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long) [body length]];
    [urlRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (data!=nil)
           {
               NSString *str = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
               ret = [str copy];
               NSLog(@"post2 response %@", str);
           }
           else
           {
               NSLog(@"error");

           }
           
   }];
       
   // request 종료
   [dataTask resume];
    
    return nil;
}

- (NSString*) sendPost2:(NSString*)pURL withData:(NSDictionary*)pDic {
    NSString* parameter = @"";
    __block NSString *ret = nil;
    
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    // request URL 설정
    NSURL *url = url = [NSURL URLWithString: pURL];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
       
    for(NSString* key in pDic.allKeys) {
        parameter = [NSString stringWithFormat:@"%@&%@=%@", parameter, key, pDic[key] ];
    }
    
    // UTF8 인코딩을 사용하여 POST 문자열 매개 변수를 데이터로 변환
    NSData *postData = [parameter dataUsingEncoding:NSUTF8StringEncoding];
    [urlRequest setHTTPBody:postData];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data!=nil)
        {
            NSString *str = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
            ret = [str copy];
            NSLog(@"post2 response %@", str);
        }
        else
        {
            NSLog(@"error");

        }
        
    }];
    
    // request 종료
    [dataTask resume];
    
    
    return ret;
}


- (void) sendPost:(NSString*)pUrl withData:(NSDictionary*)pDic {
    NSString* parameter = @"";
    
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    // request URL 설정
    NSURL *url = url = [NSURL URLWithString: pUrl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    for(NSString* key in pDic.allKeys) {
        parameter = [NSString stringWithFormat:@"%@&%@=%@", parameter, key, pDic[key]];
    }
    
    // UTF8 인코딩을 사용하여 POST 문자열 매개 변수를 데이터로 변환
    NSData *postData = [parameter dataUsingEncoding:NSUTF8StringEncoding];

    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:postData];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data!=nil)
        {
            NSString *str = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
            
            NSLog(@"post response %@", str);
            
//            NSDictionary* json = [NSJSONSerialization
//                                  JSONObjectWithData:data
//                                  options:kNilOptions
//                                  error:&error];
            
//            NSLog(@"json id:%@", json[@"id"]);
//            NSLog(@"json password:%@", json[@"password"]);
        }
        else
        {
            NSLog(@"error");
            
        }
        
    }];
    
    // request 종료
    [dataTask resume];
}


- (void) sendGet:(NSString*)pUrl withData:(NSDictionary*)pDic {
    NSString* parameter = @"";
    
    for(NSString* key in pDic.allKeys) {
        if([parameter isEqualToString:@""]) {
            parameter = [NSString stringWithFormat:@"%@=%@", key, pDic[key]];
        }else {
            parameter = [NSString stringWithFormat:@"%@&%@=%@", parameter, key, pDic[key]];
        }
    }

    NSString *getURL = [NSString stringWithFormat:@"%@?%@",pUrl,parameter];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:getURL]];
    [request setHTTPMethod:@"GET"];
    
    NSLog(@"url %@", request.URL.absoluteString);
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (data!=nil)
        {
            
            NSString *str = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
            
            NSLog(@"get response %@", str);
            
//            NSDictionary* json = [NSJSONSerialization
//                                  JSONObjectWithData:data
//                                  options:kNilOptions
//                                  error:&error];
            
//            NSLog(@"json id:%@", json[@"id"]);
//            NSLog(@"json password:%@", json[@"password"]);
        }
        else
        {
            NSLog(@"error");
            
        }
        
        
        
    }] resume];
    
}
@end
