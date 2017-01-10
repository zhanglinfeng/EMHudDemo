//
//  ViewController.m
//  EMHudDemo
//
//  Created by 张林峰 on 15/10/30.
//  Copyright (c) 2015年 张林峰. All rights reserved.
//

#import "ViewController.h"
#import "EMHud.h"

@interface ViewController () {
    EMHud *hud;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showActivity:(id)sender {
    hud = [EMHud EMHudShowActivity];
    [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(delayMethod:) userInfo:hud repeats:NO];
}
- (IBAction)showActivityAndMessage:(id)sender {
    hud = [EMHud EMHudShowActivityAndMessage:@"加载中加载中加载中"];
    [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(delayMethod:) userInfo:hud repeats:NO];
}
- (IBAction)showMessage:(id)sender {
    [EMHud EMHudShowMessage:@"未知错误！未知错误！未知错误！未知错误！未知错误！未知错误！未知错误！未知错误！未知错误！未知错误！未知错误！"];
}
- (IBAction)showMessageAndImg:(id)sender {
    [EMHud EMHudShowMessage:@"登录失败！" Image:HUD_NO];
}

- (void)delayMethod:(NSTimer *)timer {
    [(EMHud *)timer.userInfo close];
}

@end
