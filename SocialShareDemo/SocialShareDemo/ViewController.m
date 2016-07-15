//
//  ViewController.m
//  SocialShareDemo
//
//  Created by 张玉 on 16/7/11.
//  Copyright © 2016年 zhongke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UMSocialUIDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)createUI{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"分享到qq" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(shareToQQ) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 35;
    [self.view addSubview:button];
}
- (void)shareToQQ{
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
    NSString *title = KShare_Title;
    NSString *url = KShare_Url;
    //QQ
    [UMSocialData defaultData].extConfig.qqData.title = title;
    [UMSocialData defaultData].extConfig.qqData.url = url;
    //QQZone
    [UMSocialData defaultData].extConfig.qzoneData.title = title;
    [UMSocialData defaultData].extConfig.qzoneData.url = url;
    
    NSString  *path = [[NSBundle mainBundle] pathForResource:@"CgEHC1VGJz2HZm6eAAEe8iEJ1Go460_600-0_6-0" ofType:@"jpg"];
    UIImage *iconImage = [UIImage imageWithContentsOfFile:path];
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:KQQ_APP_KEY
                                      shareText:@"农业物联网能够满足作物远程管理,远程监控作物生长状态的需求"
                                     shareImage:iconImage
                                shareToSnsNames:@[UMShareToQQ,UMShareToQzone]
                                       delegate:self];
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
