//
//  ActionViewController.m
//  ObjCAction
//
//  Created by garajilpung on 11/02/2020.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "ActionViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ActionViewController ()

@property(strong,nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get the item[s] we're handling from the extension context.
    
    // For example, look for an image and place it into an image view.
    // Replace this with something appropriate for the type[s] your extension supports.
    for (NSExtensionItem *item in self.extensionContext.inputItems) {
        NSLog(@"Title %@", item.attributedTitle);
        NSLog(@"ContentText %@", item.attributedContentText);
        NSLog(@"userInfo %@", item.userInfo);
        
        for (NSItemProvider *itemProvider in item.attachments) {
            if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeImage]) {
                // This is an image. We'll load it, then place it in our image view.
                [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeImage options:nil completionHandler:^(UIImage *image, NSError *error) {
                    if(image) {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            //                            [imageView setImage:image];
                        }];
                    }
                }];
                break;
            }else if([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeData]) {
                [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeData options:nil completionHandler:^(NSData *data, NSError *error) {
                    if(data) {
                        NSLog(@"성공 후 저장함");
                    }else {
                        NSLog(@"데이터 없음");
                    }
                }];
            }
        }
    }
}

- (IBAction)done {
    // Return any edited content to the host app.
    // This template doesn't do anything, so we just echo the passed in items.
    [self.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
    
    NSString * urlString = [ NSString stringWithFormat: @"%@://%@", @"aatest", @"" ];
    NSURL * url = [ NSURL URLWithString: urlString ];
    
    NSString *className = @"UIApplication";
    if ( NSClassFromString( className ) )
    {
        id object = [ NSClassFromString( className ) performSelector: @selector( sharedApplication ) ];
        [ object performSelector: @selector( openURL:) withObject:url];
    }
}

@end
