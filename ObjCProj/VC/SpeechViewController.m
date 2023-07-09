//
//  SpeechViewController.m
//  ObjCProj
//
//  Created by SMG on 2021/07/13.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "SpeechViewController.h"
#import <AVKit/AVKit.h>


@interface SpeechViewController ()<AVSpeechSynthesizerDelegate> {
    AVSpeechUtterance *mUtterance;
    AVSpeechSynthesizer *mSynthesizer;
}

@property (weak, nonatomic) IBOutlet UITextView *tvText;
@end

@implementation SpeechViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"speech Voice Start");
    
    NSLog(@"%@", [AVSpeechSynthesisVoice speechVoices]);
    
    NSLog(@"speech Voice End");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark UIButton Event

- (IBAction)onBtnPlay:(UIButton *)sender {
    NSString* text = _tvText.text;

    if(mSynthesizer != nil) {
        [mSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
        mSynthesizer = nil;
    }
    
    if(mUtterance != nil) {
        mUtterance = nil;
    }

    mUtterance = [AVSpeechUtterance speechUtteranceWithString:text];
    
    NSLog(@"rate %f %f %f", AVSpeechUtteranceMaximumSpeechRate, AVSpeechUtteranceMinimumSpeechRate, AVSpeechUtteranceDefaultSpeechRate);
    mUtterance.rate = AVSpeechUtteranceDefaultSpeechRate;
    
    NSString* languageCode = @"ko-kR";
    mUtterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:languageCode];
    
    mSynthesizer = [[AVSpeechSynthesizer alloc] init];
    mSynthesizer.delegate = self;
    [mSynthesizer speakUtterance:mUtterance];
}

- (IBAction)onBtnPause:(UIButton *)sender {
    [mSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
}

- (IBAction)onBtnStop:(UIButton *)sender {
    [mSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    
    if(mSynthesizer != nil) {
        mSynthesizer = nil;
    }
    
    if(mUtterance != nil) {
        mUtterance = nil;
    }
}

- (IBAction)onBtnResume:(UIButton *)sender {
    [mSynthesizer continueSpeaking];
}

#pragma mark AVSpeechSynthesizerDelegate
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"didStartSpeechUtterance");
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"didFinishSpeechUtterance");
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"didPauseSpeechUtterance");
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"didContinueSpeechUtterance");
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"didCancelSpeechUtterance");
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {
    NSLog(@"willSpeakRangeOfSpeechString %lu %lu", characterRange.location, characterRange.length);
    
//    NSLog(@"String %@", utterance.speechString);

}

@end
