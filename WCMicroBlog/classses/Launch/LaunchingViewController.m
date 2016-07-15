//
//  LaunchingViewController.m
//  BuShangBanApp
//
//  Created by 王超 on 16/6/28.
//  Copyright © 2016年 Zuo. All rights reserved.
//

#import "LaunchingViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <UIKit/UIKit.h>
@interface LaunchingViewController ()
@property (nonatomic,strong) MPMoviePlayerController * moviewPlayer;
@property (nonatomic,strong) AVAudioSession * audioSession;
@end

@implementation LaunchingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMoviePlayer];
}
- (AVAudioSession *)audioSession
{
    if (_audioSession == nil) {
        _audioSession = [[AVAudioSession alloc]init];
    }
    return _audioSession;
}
- (void)createMoviePlayer
{
    [self.audioSession setCategory:AVAudioSessionCategoryAmbient error:nil];
    //    NSString * fileUrl = [[NSBundle mainBundle] pathForResource:@"bushangban" ofType:@"mp4"];
    NSString * fileUrl = [[NSBundle mainBundle] pathForResource:@"launching" ofType:@"mov"];
    NSURL * url = [NSURL fileURLWithPath:fileUrl];
    _moviewPlayer = [[MPMoviePlayerController alloc]initWithContentURL:url];
    [_moviewPlayer play];
    //    _moviewPlayer.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _moviewPlayer.view.frame = [UIScreen mainScreen].bounds;
    //    for (UIView * child in _moviewPlayer.view.subviews) {
    //        NSLog(@"child%@",child);
    //        if ([child isKindOfClass:NSClassFromString(@"MPSwipableView")]) {
    //            child.backgroundColor = [UIColor blueColor];
    //
    //        }
    //        for (UIView * grandsonView in child.subviews) {
    //            NSLog(@"grandsonView%@",grandsonView);
    //            for (UIView * grandgrandsonView in grandsonView.subviews) {
    //                NSLog(@"grandgrandsonView%@",grandgrandsonView);
    //                if ([grandgrandsonView isKindOfClass:NSClassFromString(@"MPVideoView")]) {
    //                    grandgrandsonView.backgroundColor = [UIColor colorWithRed:252/255.0 green:250/255.0 blue:248/255.0 alpha:1];
    //                    grandgrandsonView.backgroundColor = [UIColor redColor];
    //                }
    //                if ([grandgrandsonView isKindOfClass:NSClassFromString(@"MPVideoBackgroundView")]) {
    //                    grandgrandsonView.backgroundColor = [UIColor redColor];
    //                }
    //                if ([grandgrandsonView isKindOfClass:NSClassFromString(@"MPSubtitlesContainerView")]) {
    //                    grandgrandsonView.backgroundColor = [UIColor blueColor];
    //                }
    //                if ([grandgrandsonView isKindOfClass:NSClassFromString(@"MPAdvertisementContainerView")]) {
    //                    grandgrandsonView.backgroundColor = [UIColor yellowColor];
    //                }
    
    //            }
    //        }
    //    }
    [self.view addSubview:_moviewPlayer.view];
    //    _moviewPlayer.shouldAutoplay = YES;
    _moviewPlayer.view.userInteractionEnabled = NO;
    _moviewPlayer.repeatMode = MPMovieRepeatModeNone;
    _moviewPlayer.fullscreen = YES;
    [_moviewPlayer setControlStyle:MPMovieControlStyleNone];
    //    [_moviewPlayer setFullscreen:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
