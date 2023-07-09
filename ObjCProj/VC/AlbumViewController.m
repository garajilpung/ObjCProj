//
//  AlbumViewController.m
//  test
//
//  Created by suhyup02 on 07/02/2020.
//  Copyright © 2020 aa. All rights reserved.
//

#import "AlbumViewController.h"
#import <AVKit/AVKit.h>
#import <Photos/Photos.h>

// 이미지를 여러개 선택할 경우 필요한 라이브러리
#import <CTAssetsPickerController/CTAssetsPickerController.h>

@interface AlbumViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, CTAssetsPickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lbContent;

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lbContent.layer.borderWidth = 1.0f;
    _lbContent.layer.borderColor = [UIColor blackColor].CGColor;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onBtnCarmera:(id)sender {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (granted) {
                    [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
                    
                } else {

                }
            });
        }];
    } else if (status == AVAuthorizationStatusAuthorized) {
        NSLog(@"Show image picker - Camera!!!");
        [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
    
    } else if (status == AVAuthorizationStatusDenied) {
        NSLog(@"아이폰 설정의 개인 정보 보호 > 카메라 > 수협뱅크개인 앱에서 카메라에 대해 접근을 허용해 주세요.");
        
    } else {
        NSLog(@"카메라를 이용할 수 없습니다.");
        
    }
    
}

- (IBAction)onBtnAlbum:(id)sender {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus _status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (_status == PHAuthorizationStatusAuthorized) {
                    [self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
                } else {
                    [self showImagePicker:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
                }
            });
        }];
    } else if (status == PHAuthorizationStatusAuthorized) {
        NSLog(@"Show image picker - Library!!!");
        [self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
    } else {
        [self showImagePicker:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
}

- (IBAction)onBtnAlbumMuitiSelect:(id)sender {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus _status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (_status == PHAuthorizationStatusAuthorized) {
                    [self showImagePickerMultiSelect:UIImagePickerControllerSourceTypePhotoLibrary];
                } else {
                    [self showImagePickerMultiSelect:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
                }
            });
        }];
    } else if (status == PHAuthorizationStatusAuthorized) {
        NSLog(@"Show image picker - Library!!!");
        [self showImagePickerMultiSelect:UIImagePickerControllerSourceTypePhotoLibrary];
    } else {
        [self showImagePickerMultiSelect:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
}

- (void)showImagePicker:(UIImagePickerControllerSourceType)pType {
    // 카메라는 시뮬레이터에서 사용 불가
    if (![UIImagePickerController isSourceTypeAvailable:pType]) {
        NSLog(@"사용 불가");
        return;
    }
    
    if (pType == UIImagePickerControllerSourceTypeCamera) {
        UIImagePickerController *imgPickerVC = [[UIImagePickerController alloc] init];
        [imgPickerVC setDelegate:self];
        [imgPickerVC setAllowsEditing:YES];
        
        [imgPickerVC setSourceType:pType];
        
        imgPickerVC.showsCameraControls = YES;
        imgPickerVC.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        
        [self presentViewController:imgPickerVC animated:YES completion:^{
            
        }];
    }else if(pType == UIImagePickerControllerSourceTypeSavedPhotosAlbum || pType == UIImagePickerControllerSourceTypePhotoLibrary){
        /* UIImagePickerController를 사용할 경우
         한번에 하나의 이미지만 선택이 가능하다.
         그러므로 여러개의 이미지를 선택할 경우 외부 라이브러리를 사용하거나 ImagePickerController 자신이 구현해야 한다.
         */
        UIImagePickerController *imgPickerVC = [[UIImagePickerController alloc] init];
        [imgPickerVC setDelegate:self];
        [imgPickerVC setAllowsEditing:YES];

        [imgPickerVC setSourceType:pType];

        [self presentViewController:imgPickerVC animated:YES completion:^{

        }];
    }
}

- (void)showImagePickerMultiSelect:(UIImagePickerControllerSourceType)pType {
    if (![UIImagePickerController isSourceTypeAvailable:pType]) {
        NSLog(@"사용 불가");
        return;
    }
    
    /*
     이미지 여러개를 선택할 경우 CTAssetsPickerController 를 사용하여 구현한다.
     */
    
    // init picker
    CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
    
    // set delegate
    picker.delegate = self;
    
    // Optionally present picker as a form sheet on iPad
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        picker.modalPresentationStyle = UIModalPresentationFormSheet;
    
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

- (void)closeImagePicker {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info {
    NSLog(@"ImagePicker Dic :%@", info);

    UIImage *img = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    NSString *imgUrl = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    
    NSLog(@"img AssetURL %@", imgUrl);
    NSLog(@"%0.2f %0.2f", img.size.width, img.size.height);
    
    [self performSelector:@selector(closeImagePicker) withObject:nil afterDelay:0.1];
}

//UIImagePickerController에서 취소 키를 누른 경우
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self closeImagePicker];
    
}

#pragma CTAssetsPickerControllerDelegate Delegate
- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    // assets contains PHAsset objects.
    NSLog(@"assets Arraay%@", assets);
    /*
     assets 안에 있는 값은 @"UIImagePickerControllerPHAsset" 로 가여온
     PHAsset 값이다.
     */
    
    // FirstObject Data Log
    PHAsset *asset = (PHAsset*)[assets firstObject];
    
    NSLog(@"asset mediaType [%ld]", (long)asset.mediaType);
    NSLog(@"asset mediaSubtypes [%lu]", (unsigned long)asset.mediaSubtypes);
    NSLog(@"asset pixelWidth [%lu]", (unsigned long)asset.pixelWidth);
    NSLog(@"asset pixelHeight [%lu]", (unsigned long)asset.pixelHeight);
    
    NSLog(@"asset creationDate [%@]", asset.creationDate);
    NSLog(@"asset modificationDate [%@]", asset.modificationDate);
    NSLog(@"asset location [%@]", asset.location);
    NSLog(@"asset creationDate [%@]", asset.creationDate);
    
    [self closeImagePicker];
    
    // get UIImage
    
    PHImageManager *manager = [PHImageManager defaultManager];
    PHImageRequestOptions *imgOpt = [[PHImageRequestOptions alloc] init];
    imgOpt.resizeMode   = PHImageRequestOptionsResizeModeExact;
    imgOpt.deliveryMode   = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:[assets count]];
    NSUInteger maxLen = [assets count];
    
    
    for (PHAsset *asset in assets){
        [manager requestImageForAsset:asset
                           targetSize:PHImageManagerMaximumSize
                          contentMode:PHImageContentModeDefault
                              options:imgOpt
                        resultHandler:^void(UIImage *image, NSDictionary *info) {
                            NSLog(@"Img Dic %@", info);
                            
                            [images addObject:image];
                            
                            if(maxLen == images.count) {
                                NSLog(@"이미지 데이터 로드를 완료했습니다.");
                            }
                        }];
    }
    
}
@end
