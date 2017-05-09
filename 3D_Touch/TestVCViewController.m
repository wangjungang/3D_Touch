//
//  TestVCViewController.m
//  3D_Touch
//
//  Created by 冷求慧 on 16/12/27.
//  Copyright © 2016年 Leng. All rights reserved.
//

#import "TestVCViewController.h"

@interface TestVCViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;

@end

@implementation TestVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebView];

}
-(void)loadWebView{
    self.mainWebView.scalesPageToFit=YES;
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
    self.mainWebView.layer.cornerRadius=150;
    self.mainWebView.layer.masksToBounds=YES;
}
@end
