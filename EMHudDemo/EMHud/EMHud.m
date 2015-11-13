//
//  EMHud.m
//  EMHudDemo
//
//  Created by 张林峰 on 15/10/30.
//  Copyright (c) 2015年 张林峰. All rights reserved.
//

#import "EMHud.h"

@implementation EMHud

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
*  初始化
*
*  @param superView （可选参数）有则将指示层加到superView上，否则加到keyWindow上
*  @param type      指示层类型
*  @param message   显示的文字
*  @param image     显示的图片
*
*  @return return value description
*/
- (id)initWithView:(UIView *)superView EMHudType:(EMHudType)type Message:(NSString *)message Image:(UIImage *)image {
    self = [super init];
    if (self) {
        switch (type) {
            case EMHudType_SimpleActivity:
                currentView = [[NSBundle mainBundle]loadNibNamed:@"EMHud" owner:self options:nil][0];
                currentView.layer.cornerRadius = 10;
                
                [(UIActivityIndicatorView *)[currentView viewWithTag:99] startAnimating];
                break;
            case EMHudType_ActivityAndLabel:
                currentView = [[NSBundle mainBundle]loadNibNamed:@"EMHud" owner:self options:nil][1];
                [(UIActivityIndicatorView *)[currentView viewWithTag:99] startAnimating];
                ((UILabel *)[currentView viewWithTag:100]).text = message;
                currentView.layer.cornerRadius = 10;
                break;
            case EMHudType_SimpleLabel:
            {
                currentView = [[NSBundle mainBundle]loadNibNamed:@"EMHud" owner:self options:nil][2];
                currentView.layer.cornerRadius = 10;
                UILabel *label = (UILabel *)[currentView viewWithTag:100];
//                CGSize size = [message sizeWithFont:[UIFont systemFontOfSize:12]constrainedToSize:CGSizeMake(80, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
                
                label.text = message;
            }
                break;
            case EMHudType_LabelAndImage:
                currentView = [[NSBundle mainBundle]loadNibNamed:@"EMHud" owner:self options:nil][3];
                currentView.layer.cornerRadius = 10;
                ((UILabel *)[currentView viewWithTag:100]).text = message;
                if (image) {
                    ((UIImageView *)[currentView viewWithTag:101]).image = image;
                }
                break;
            default:
                break;
        }
        
        if (superView) {
            [superView addSubview:currentView];
            currentView.center = superView.center;
        } else {
            [[UIApplication sharedApplication].keyWindow addSubview:currentView];
            currentView.center =[UIApplication sharedApplication].keyWindow.center;
        }
        
        if (type == EMHudType_SimpleLabel || type == EMHudType_LabelAndImage) {
            [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(close) userInfo:nil repeats:NO];
        }
    }
    return self;
}


//指示层仅仅显示转圈的
+ (EMHud *)EMHudShowActivity {
    
    return [[EMHud alloc]initWithView:nil EMHudType:EMHudType_SimpleActivity Message:nil Image:nil];
}

//指示层仅仅显示文字
+ (EMHud *)EMHudShowMessage:(NSString*)message {
    return [[EMHud alloc]initWithView:nil EMHudType:EMHudType_SimpleLabel Message:message Image:nil];
}

//指示层显示转圈的加文字
+ (EMHud *)EMHudShowActivityAndMessage:(NSString *)message {
    return [[EMHud alloc]initWithView:nil EMHudType:EMHudType_ActivityAndLabel Message:message Image:nil];
}

/**
 *  指示层显示文字和图片
 *
 *  @param message 传入文字参数
 *  @param img     （可选参数）有则显示传入的图片，没有就显示默认图片
 */
+ (EMHud *)EMHudShowMessage:(NSString *)message Image:(UIImage *)img {
    return [[EMHud alloc]initWithView:nil EMHudType:EMHudType_LabelAndImage Message:message Image:img];
}

//关闭指示层
- (void)close {
    [currentView removeFromSuperview];
}


@end
