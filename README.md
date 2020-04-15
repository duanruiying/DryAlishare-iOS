# DryAlishare-iOS
iOS: 简化支付宝分享

## 官网:
* 更新时间：2020-02-06 22:17:56
* [蚂蚁金服开放平台](https://docs.open.alipay.com/215/105276/)

## Prerequisites
* iOS 10.0+
* ObjC、Swift

## Installation
* pod 'DryAlishare-iOS'
* URL Types 添加回调scheme(identifier:"alipayShare"、URL Schemes:"ap+AppID")
* info.plist文件属性LSApplicationQueriesSchemes中增加alipayshare(注意大小写)

## Features
1. 注册SDK，需要在在[蚂蚁金服开放平台](https://docs.open.alipay.com/215/105276/)申请AppID
```
[DryAlishare registerSDK:"appID"];
```
2. 处理支付宝通过URL启动App时传递的数据
``` 
- (BOOL)application:(UIApplication *)app openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    [DryAlishare handleOpenURL:url];
    return YES;
}
```
3. 分享文本
```
DryAlishareText *text = [[DryAlishareText alloc] init];
[DryAlishare shareText:text completion:^(DryAlishareCode code) {

}];
```
4. 分享图片
```
DryAlishareImage *image = [[DryAlishareImage alloc] init];
[DryAlishare shareImage:image completion:^(DryAlishareCode code) {

}];
```
5. 分享web
```
DryAlishareWeb *web = [[DryAlishareWeb alloc] init];
[DryAlishare shareWeb:web completion:^(DryAlishareCode code) {

}];
```
