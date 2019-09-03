//
//  DryAlishare.h
//  DryAlishare
//
//  Created by Ruiying Duan on 2019/4/26.
//

#import <Foundation/Foundation.h>

@class DryAlishareText;
@class DryAlishareImage;
@class DryAlishareWeb;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 状态码
typedef NS_ENUM(NSInteger, DryAlishareCode) {
    /// 成功
    kDryAlishareCodeSuccess,
    /// 未知错误
    kDryAlishareCodeUnknown,
    /// SDK未注册
    kDryAlishareCodeUnregister,
    /// 未安装客户端
    kDryAlishareCodeUninstall,
    /// 客户端不支持
    kDryAlishareCodeUnsupport,
    /// 发送失败
    kDryAlishareCodeSendFail,
    /// 用户拒绝授权
    kDryAlishareCodeAuthDeny,
    /// 用户取消
    kDryAlishareCodeUserCancel,
    /// 参数错误
    kDryAlishareCodeParamErr,
};

#pragma mark - Block
/// 状态码回调
typedef void (^BlockDryAlishareCode) (DryAlishareCode code);

#pragma mark - DryAlishare
@interface DryAlishare : NSObject

/// @说明 支付宝客户端是否安装
/// @返回 BOOL
+ (BOOL)isAPAppInstalled;

/// @说明 判断当前支付宝的版本是否支持OpenApi
/// @返回 BOOL
+ (BOOL)isAPAppSupportOpenApi;

/// @说明 注册SDK
/// @注释 需要在每次启动应用程序时调用，请保证在主线程中调用此函数
/// @参数 appID:  蚂蚁金服开放平台下发的账号
/// @返回 void
+ (void)registerSDK:(NSString *)appID;

/// @说明 处理支付宝通过URL启动App时传递的数据
/// @注释 在application:openURL:options:中调用
/// @返回 BOOL
+ (BOOL)handleOpenURL:(NSURL *)url;

/// @说明 分享文本
/// @参数 obj:   分享的文本对象
/// @参数 completion: 状态吗回调
/// @返回 void
+ (void)shareText:(DryAlishareText *)obj completion:(BlockDryAlishareCode)completion;

/// @说明 分享图片
/// @参数 obj:   分享的图片对象
/// @参数 completion: 状态吗回调
/// @返回 void
+ (void)shareImage:(DryAlishareImage *)obj completion:(BlockDryAlishareCode)completion;

/// @说明 分享网页
/// @参数 obj:   分享的网页对象
/// @参数 completion: 状态吗回调
/// @返回 void
+ (void)shareWeb:(DryAlishareWeb *)obj completion:(BlockDryAlishareCode)completion;

@end

NS_ASSUME_NONNULL_END
