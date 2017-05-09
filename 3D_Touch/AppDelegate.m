//
//  AppDelegate.m
//  3D_Touch
//
//  Created by 冷求慧 on 16/12/27.
//  Copyright © 2016年 Leng. All rights reserved.
//

#import "AppDelegate.h"

#define openUrlWithBD @"https://www.baidu.com/"

@interface AppDelegate ()
@property (nonatomic,strong)UITraitCollection *traitCollection;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"App加载完毕");
    
    return YES;
}
#pragma mark 点击对应Icon的回调,判断对应的Icon
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
#warning 3D_Touch的功能只有>=Iphone6s的情况下才能使用(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    
    NSLog(@"得到的点击类型标识是:%@",shortcutItem.type);
    if([shortcutItem.type isEqualToString:@"com.leng.Search"]){
        NSLog(@"点击了搜索");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",openUrlWithBD]]]; //通过Safari打开对应的页面
    }
    else if ([shortcutItem.type isEqualToString:@"com.leng.Navigation"]){
        NSLog(@"点击了导航");
        [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationWithNavigation" object:nil userInfo:nil]; // 通过发送通知及时实现导航操作
    }
    else if ([shortcutItem.type isEqualToString:@"com.leng.Play"]){
        NSLog(@"点击了播放的Item");
    }
    else if ([shortcutItem.type isEqualToString:@"com.leng.Love"]){
        NSLog(@"点击了觅她的Item");
    }
    else if ([shortcutItem.type isEqualToString:@"com.leng.Share"]){
        NSLog(@"点击了搜索的Item");
    }
    else{
        
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"App将要失去焦点");
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"App将要回到后台的回调");
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"将要回到App中,检测用户的登录状态");
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"App变成焦点的回调");
}
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"App将要杀死的回调");
}
@end
