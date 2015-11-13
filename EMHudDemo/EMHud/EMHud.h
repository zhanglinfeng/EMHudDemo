//
//  EMHud.h
//  EMHudDemo
//
//  Created by 张林峰 on 15/10/30.
//  Copyright (c) 2015年 张林峰. All rights reserved.
//

/******************************使用方法如下**************************************


- (IBAction)showActivity:(id)sender {
    EMHud ＊hud = [EMHud EMHudShowActivity];
    ...
    [hud close];
}
- (IBAction)showActivityAndMessage:(id)sender {
    EMHud ＊hud = [EMHud EMHudShowActivityAndMessage:@"haha哈哈呵呵"];
    ...
    [hud close];
}
 
- (IBAction)showMessage:(id)sender {
    [EMHud EMHudShowMessage:@"未知错误"];
}
 
- (IBAction)showMessageAndImg:(id)sender {
    [EMHud EMHudShowMessage:@"登录失败" Image:HUD_NO];
}

**************************************************************************/


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EMHudType) {
    EMHudType_SimpleActivity,//仅仅转圈的
    EMHudType_ActivityAndLabel,//转圈加文字
    EMHudType_SimpleLabel,//仅仅文字
    EMHudType_LabelAndImage//文字加图片
};

#define HUD_NO [UIImage imageNamed:@"HUD_NO.png"]
#define HUD_YES [UIImage imageNamed:@"HUD_YES.png"]

@interface EMHud : UIView {
    UIView *currentView;
}

/**
 *  初始化
 *
 *  @param superView （可选参数）有则将指示层加到superView上，否则加到keyWindow上
 *  @param type      指示层类型
 *  @param message   （可选参数）显示的文字
 *  @param image     （可选参数）显示的图片
 *
 *  @return return value description
 */
- (id)initWithView:(UIView *)superView EMHudType:(EMHudType)type Message:(NSString *)message Image:(UIImage *)image;


//指示层仅仅显示转圈的
+ (EMHud *)EMHudShowActivity;

//指示层仅仅显示文字
+ (EMHud *)EMHudShowMessage:(NSString*)message;

//指示层显示转圈的加文字
+ (EMHud *)EMHudShowActivityAndMessage:(NSString *)message;

/**
 *  指示层显示文字和图片
 *
 *  @param message 传入文字参数
 *  @param img     （可选参数）有则显示传入的图片，没有就显示默认图片
 */
+ (EMHud *)EMHudShowMessage:(NSString *)message Image:(UIImage *)img;

//关闭指示层
- (void)close;

@end
