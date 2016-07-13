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
    
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    //这里只配置了qq分享后跳转的url,其他平台可再添加配置,如微信平台将qqData替换为wechatSessionData
    [UMSocialData defaultData].extConfig.qqData.url = @"itms://itunes.apple.com/gb/app/yi-dong-cai-bian/id1116458813?mt=8";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:QQ_APP_KEY
                                      shareText:@"农业物联网能够满足作物远程管理,远程监控作物生长状态的需求"
                                     shareImage:[UIImage imageNamed:@"icon"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                       delegate:self];
    //分享URL图片资源
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:@"http://www.baidu.com/img/bdlogo.gif"];
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    [UMSocialData defaultData].extConfig.qqData.url = @"itms://itunes.apple.com/gb/app/yi-dong-cai-bian/id1116458813?mt=8";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:QQ_APP_KEY
                                      shareText:@"农业物联网能够满足作物远程管理,远程监控作物生长状态的需求"
                                     shareImage:[UIImage imageNamed:@"icon"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
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
