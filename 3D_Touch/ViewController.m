//
//  ViewController.m
//  3D_Touch
//
//  Created by 冷求慧 on 16/12/27.
//  Copyright © 2016年 Leng. All rights reserved.
//

#import "ViewController.h"
#import "TestVCViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) IBOutlet UIView *mainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add3dTouchInView];
//    [self createShortcutItem];
}
#pragma mark 创建对应的点击Item()
-(void)createShortcutItem{
    // 创建对应的Icon图标(使用的系统的)
    UIApplicationShortcutIcon *itemWithSearch=[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    UIApplicationShortcutIcon *itemWithNavigation=[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLocation];
    UIApplicationShortcutIcon *itemWithPlay=[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay];
    UIApplicationShortcutIcon *itemWithLove=[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];

    UIApplicationShortcutItem *searchItem=[[UIApplicationShortcutItem alloc]initWithType:@"com.leng.Search" localizedTitle:@"搜索" localizedSubtitle:@"简单更懂你~👀" icon:itemWithSearch userInfo:nil];
    UIApplicationShortcutItem *navigaItem=[[UIApplicationShortcutItem alloc]initWithType:@"com.leng.Navigation" localizedTitle:@"导航" localizedSubtitle:@"跟着我一路向西-🐔" icon:itemWithNavigation userInfo:nil];
    UIApplicationShortcutItem *playItem=[[UIApplicationShortcutItem alloc]initWithType:@"com.leng.Play" localizedTitle:@"播放" localizedSubtitle:@"快乐的播放着...💽" icon:itemWithPlay userInfo:nil];
    UIApplicationShortcutItem *loveItem=[[UIApplicationShortcutItem alloc]initWithType:@"com.leng.Love" localizedTitle:@"觅她" localizedSubtitle:@"爱起航,梦飞翔￥💝" icon:itemWithLove userInfo:nil];
    
    //    UIApplicationShortcutItemIconType     UIApplicationShortcutIconTypeSearch
    //    UIApplicationShortcutItemSubtitle
    //    UIApplicationShortcutItemTitle
    //    UIApplicationShortcutItemType
    
    [UIApplication sharedApplication].shortcutItems=@[searchItem,navigaItem,playItem,loveItem]; //添加到对应的数组中
    
}
#pragma mark 在对应的视图上添加3D_Touch
-(void)add3dTouchInView{
    // 判断设备支不支持Touch操作
    if([self respondsToSelector:@selector(traitCollection)]){
        if([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]){  // self.traitCollection 是UIKit的子类
            if (self.traitCollection.forceTouchCapability==UIForceTouchCapabilityAvailable) {
                [self registerForPreviewingWithDelegate:self sourceView:self.mainView]; // 必须用控制器注册对应的触发的View视图,并且实现代理方法,
            }
        }
    }
}
#pragma mark -实现PreviewingDelegate代理的方法
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    TestVCViewController *testVC=[self.storyboard instantiateViewControllerWithIdentifier:@"TestVC"];
    return testVC;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
}

@end
