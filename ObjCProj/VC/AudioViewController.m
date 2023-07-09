//
//  AudioViewController.m
//  ObjCProj
//
//  Created by SMG on 2021/10/16.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "AudioViewController.h"
#import <AVKit/AVKit.h>

@interface AudioViewController () {
    AVPlayer *mAvPlayer;
    
}

@end

@implementation AudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setMode:AVAudioSessionModeDefault error:nil];
    [[AVAudioSession sharedInstance] setActive:TRUE error:nil];

    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
 
    [[AVAudioSession sharedInstance] setActive:FALSE error:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UIButton Event
- (IBAction)onBtnPlay:(id)sender {
    if(mAvPlayer != nil) {
        [mAvPlayer pause];
    }
    
    NSString *strURL = [NSString stringWithFormat:@"%@/test/ss.wav", [Utility getHost]];
    NSURL *url = [NSURL URLWithString:strURL];
    
    mAvPlayer = [AVPlayer playerWithURL:url];
    [mAvPlayer play];
    
}

- (IBAction)onBtnStop:(id)sender {
    if(mAvPlayer != nil) {
        [mAvPlayer pause];
        mAvPlayer = nil;
    }
}

- (IBAction)onBtnPause:(id)sender {
    if(mAvPlayer != nil) {
        [mAvPlayer pause];
    }
}

@end
