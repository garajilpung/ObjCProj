//
//  ShareViewController.m
//  ObjCShare
//
//  Created by garajilpung on 11/02/2020.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "ShareViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>

#define HIDE_POST_DIALOG

@interface ShareViewController ()

@end

@implementation ShareViewController

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    NSString* text = self.contentText;
    
    NSLog(@"text :%@", text);
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
#ifdef HIDE_POST_DIALOG
    return;
#else
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
#endif
}

#ifdef HIDE_POST_DIALOG
- ( NSArray * ) configurationItems
{
    // Comment out this whole function if you want the Post dialog to show.
    [ self passSelectedItemsToApp ];
    
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}
#endif

- ( void ) passSelectedItemsToApp
{
    NSExtensionItem * item = self.extensionContext.inputItems.firstObject;
    
    // Reset the counter and the argument list for invoking the app:
    
    // Iterate through the attached files
    for ( NSItemProvider * itemProvider in item.attachments )
    {
        // Check if we are sharing a JPEG
        if ( [ itemProvider hasItemConformingToTypeIdentifier: ( NSString * ) kUTTypeData ] )
        {
            // Load it, so we can get the path to it
            [ itemProvider loadItemForTypeIdentifier: ( NSString * ) kUTTypeData
                                             options: NULL
                                   completionHandler: ^ ( NSData * pData, NSError * error )
             {
                 //                 static int itemIdx = 0;
                 
                 if ( NULL != error )
                 {
                     NSLog( @"There was an error retrieving the attachments: %@", error );
                     return;
                 }
                 
                 if(pData  == nil) {
                     NSLog(@"Not Data");
                 }else {
                     NSLog(@"Not Empty Data and save Data");
                     //save Data
                 }
                 
                 // The app won't be able to access the images by path directly in the Camera Roll folder,
                 // so we temporary copy them to a folder which both the extension and the app can access:
                 //                 NSString * filePath = [ self saveImageToAppGroupFolder: image imageIndex: itemIdx ];
                 
                 // If we have reached the last attachment, it's time to hand control to the app:
                 
             } ];
        }
    }
    
    [ self invokeApp: @"vdwfag dv" ];
}

- ( NSString * ) saveImageToAppGroupFolder: ( UIImage * ) image
                                imageIndex: ( int ) imageIndex
{
    assert( NULL != image );
    
    NSData * jpegData = UIImageJPEGRepresentation( image, 1.0 );
    
    NSURL * containerURL = [ [ NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier: @"APP_SHARE_GROUP" ];
    NSString * documentsPath = containerURL.path;
    
    // Note that we aren't using massively unique names for the files in this example:
    NSString * fileName = [ NSString stringWithFormat: @"image%d.jpg", imageIndex ];
    
    NSString * filePath = [ documentsPath stringByAppendingPathComponent: fileName ];
    [ jpegData writeToFile: filePath atomically: YES ];
    
    return filePath;
}

- ( void ) invokeApp: ( NSString * ) invokeArgs
{
    // As we'll be creating UI, make sure the calls happen on the main thread:
    NSString * urlString = [ NSString stringWithFormat: @"%@://%@", @"aatest", @"psbm" ];
    NSURL * url = [ NSURL URLWithString: urlString ];
    
    NSString *className = @"UIApplication";
    if ( NSClassFromString( className ) )
    {
        id object = [ NSClassFromString( className ) performSelector: @selector( sharedApplication ) ];
        [ object performSelector: @selector( openURL:) withObject:url];
    }
    
    //    // Now let the host app know we are done, so that it unblocks its UI:
    [super didSelectPost];
    
}

CGFloat m_oldAlpha = 1.0;
#ifdef HIDE_POST_DIALOG
- ( void ) willMoveToParentViewController: ( UIViewController * ) parent
{
    m_oldAlpha = [ self.view alpha ];
    [ self.view setAlpha: 0.0 ];
}
#endif

#ifdef HIDE_POST_DIALOG
- ( void ) didMoveToParentViewController: ( UIViewController * ) parent
{
    //     Restore the original transparency:
    [ self.view setAlpha: m_oldAlpha ];
}
#endif



#ifdef HIDE_POST_DIALOG
- ( id ) init
{
    if ( self = [ super init ] )
    {
        [ [ NSNotificationCenter defaultCenter ] addObserver: self selector: @selector( keyboardWillShow: ) name: UIKeyboardWillShowNotification    object: nil ];
    }
    
    return self;
}
#endif

#ifdef HIDE_POST_DIALOG
- ( void ) keyboardWillShow: ( NSNotification * ) note
{
    [ self.view endEditing: true ];
}
#endif

@end
