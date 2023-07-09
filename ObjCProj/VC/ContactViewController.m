//
//  ContactViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/02/25.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "ContactViewController.h"
#import <Contacts/Contacts.h>

@interface ContactViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbCount;

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if( status == CNAuthorizationStatusDenied || status == CNAuthorizationStatusRestricted)
    {
        NSLog(@"access denied");
    }else if(status == CNAuthorizationStatusAuthorized){
        //Create repository objects contacts
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        
        NSArray *keys = @[CNContactFamilyNameKey, CNContactGivenNameKey, CNContactPhoneNumbersKey];
        NSString *containerId = contactStore.defaultContainerIdentifier;
        NSPredicate *predicate = [CNContact predicateForContactsInContainerWithIdentifier:containerId];
        
        // Create a request object
        CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
        request.predicate = predicate;
        __block int count = 0;
        [contactStore enumerateContactsWithFetchRequest:request
                                                  error:nil
                                             usingBlock:^(CNContact* __nonnull contact, BOOL* __nonnull stop)
         {
             // Contact one each function block is executed whenever you get
//             NSString *phoneNumber = @"";
//             if( contact.phoneNumbers)
//                 phoneNumber = [[[contact.phoneNumbers firstObject] value] stringValue];
//
//             NSLog(@"phoneNumber = %@", phoneNumber);
//             NSLog(@"givenName = %@", contact.givenName);
//             NSLog(@"familyName = %@", contact.familyName);
//             NSLog(@"email = %@", contact.emailAddresses);
            
            NSString *phoneNumber = @"";
            if( contact.phoneNumbers) {
                 phoneNumber = [[[contact.phoneNumbers firstObject] value] stringValue];
                NSLog(@"phoneNumber %@", phoneNumber);
            }
            
            if( contact.familyName)
                NSLog(@"familyName %@", contact.familyName);
            
            if( contact.givenName)
                NSLog(@"givenName %@", contact.givenName);
            
            count ++;
            
            NSLog(@"count %d", count);
         }];
    }else {
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        
        [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if(!granted) {
                NSLog(@"you must allow app permissions to access your contacts from this app");
                return;
            }else {
            }
        }];
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

- (IBAction)onBtnDoc:(id)sender {
    UIDocumentPickerViewController *vc = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"public.data"] inMode:UIDocumentPickerModeOpen];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

@end
