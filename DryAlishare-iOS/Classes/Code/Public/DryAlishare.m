//
//  DryAlishare.m
//  DryAlishare
//
//  Created by Ruiying Duan on 2019/4/26.
//

#import "DryAlishare.h"
#import "DryAlishareText.h"
#import "DryAlishareImage.h"
#import "DryAlishareWeb.h"
#import "APOpenAPI.h"

#pragma mark - DryAlishare(申明)
@interface DryAlishare () <APOpenAPIDelegate>

/// SDK是否注册成功
@property (nonatomic, readwrite, assign) BOOL isRegister;
/// 状态码回调
@property (nonatomic, readwrite, nullable, copy) BlockDryAlishareCode respBlock;

@end

#pragma mark - DryAlishare(实现)
@implementation DryAlishare

/// 创建单例
+ (instancetype)sharedInstance {
    
    static DryAlishare *theInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        theInstance = [[DryAlishare alloc] init];
    });
    return theInstance;
}

/// 构造
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

/// 析构
- (void)dealloc {
    
}

/// 支付宝客户端是否安装
+ (BOOL)isAPAppInstalled {
    return [APOpenAPI isAPAppInstalled];
}

/// 判断当前支付宝的版本是否支持OpenApi
+ (BOOL)isAPAppSupportOpenApi {
    return [APOpenAPI isAPAppSupportOpenApi];
}

/// 注册SDK
+ (void)registerSDK:(NSString *)appID {
    
    /// 注册
    if (appID) {
        [DryAlishare sharedInstance].isRegister = [APOpenAPI registerApp:appID];
    }
}

/// 处理支付宝通过URL启动App时传递的数据
+ (BOOL)handleOpenURL:(NSURL *)url {
    return [APOpenAPI handleOpenURL:url delegate:[DryAlishare sharedInstance]];
}

/// 检查分享条件
+ (BOOL)isCanShared:(id)obj completion:(BlockDryAlishareCode)completion {
    
    /// 检查Block
    if (!completion) {
        return NO;
    }
    
    /// 检查(是否注册SDK)
    if (![DryAlishare sharedInstance].isRegister) {
        completion(kDryAlishareCodeUnregister);
        return NO;
    }
    
    /// 检查(是否安装客户端)
    if (![DryAlishare isAPAppInstalled]) {
        completion(kDryAlishareCodeUninstall);
        return NO;
    }
    
    /// 检查(是否支持分享)
    if (![DryAlishare isAPAppSupportOpenApi]) {
        completion(kDryAlishareCodeUnsupport);
        return NO;
    }
    
    /// 检查数据
    if (!obj) {
        completion(kDryAlishareCodeParamErr);
        return NO;
    }
    
    return YES;
}

/// 分享文本
+ (void)shareText:(DryAlishareText *)obj completion:(BlockDryAlishareCode)completion {
    
    /// 检查Block
    if (!completion) {
        return;
    }

    /// 检查分享条件
    if (![DryAlishare isCanShared:obj completion:completion]) {
        return;
    }
    
    /// 更新Block
    [DryAlishare sharedInstance].respBlock = completion;
    
    /// 创建分享对象
    APMediaMessage *message = [[APMediaMessage alloc] init];
    
    /// 标题
    message.title = @"";
    if (obj.title) {
        message.title = obj.title;
    }
    
    /// 描述
    message.desc = @"";
    if (obj.descrip) {
        message.desc = obj.descrip;
    }
    
    /// 略缩图
    if (obj.thumbImgData) {
        message.thumbData = obj.thumbImgData;
    }else if (obj.thumbImgUrl) {
        message.thumbUrl = obj.thumbImgUrl;
    }
    
    /// 文本
    APShareTextObject *media = [[APShareTextObject alloc] init];
    media.text = @"";
    if (obj.text) {
        media.text = obj.text;
    }
    message.mediaObject = media;
    
    /// 分享
    APSendMessageToAPReq *request = [[APSendMessageToAPReq alloc] init];
    request.message = message;
    [APOpenAPI sendReq:request];
}

/// 分享图片
+ (void)shareImage:(DryAlishareImage *)obj completion:(BlockDryAlishareCode)completion {
    
    /// 检查Block
    if (!completion) {
        return;
    }
    
    /// 检查分享条件
    if (![DryAlishare isCanShared:obj completion:completion]) {
        return;
    }
    
    /// 更新Block
    [DryAlishare sharedInstance].respBlock = completion;
    
    /// 创建分享对象
    APMediaMessage *message = [[APMediaMessage alloc] init];
    
    /// 标题
    message.title = @"";
    if (obj.title) {
        message.title = obj.title;
    }
    
    /// 描述
    message.desc = @"";
    if (obj.descrip) {
        message.desc = obj.descrip;
    }
    
    /// 略缩图
    if (obj.thumbImgData) {
        message.thumbData = obj.thumbImgData;
    }else if (obj.thumbImgUrl) {
        message.thumbUrl = obj.thumbImgUrl;
    }
    
    /// 图片
    APShareImageObject *media = [[APShareImageObject alloc] init];
    if (obj.imgData) {
        media.imageData = obj.imgData;
    }else if (obj.imgUrl) {
        media.imageUrl = obj.imgUrl;
    }
    message.mediaObject = media;
    
    /// 分享
    APSendMessageToAPReq *request = [[APSendMessageToAPReq alloc] init];
    request.message = message;
    [APOpenAPI sendReq:request];
}

/// 分享网页
+ (void)shareWeb:(DryAlishareWeb *)obj completion:(BlockDryAlishareCode)completion {
    
    /// 检查Block
    if (!completion) {
        return;
    }
    
    /// 检查分享条件
    if (![DryAlishare isCanShared:obj completion:completion]) {
        return;
    }
    
    /// 更新Block
    [DryAlishare sharedInstance].respBlock = completion;
    
    /// 创建分享对象
    APMediaMessage *message = [[APMediaMessage alloc] init];
    
    /// 标题
    message.title = @"";
    if (obj.title) {
        message.title = obj.title;
    }
    
    /// 描述
    message.desc = @"";
    if (obj.descrip) {
        message.desc = obj.descrip;
    }
    
    /// 略缩图
    if (obj.thumbImgData) {
        message.thumbData = obj.thumbImgData;
    }else if (obj.thumbImgUrl) {
        message.thumbUrl = obj.thumbImgUrl;
    }
    
    /// 网页
    APShareWebObject *media = [[APShareWebObject alloc] init];
    if (obj.webUrl) {
        media.wepageUrl = obj.webUrl;
    }
    message.mediaObject = media;
    
    /// 分享
    APSendMessageToAPReq *request = [[APSendMessageToAPReq alloc] init];
    request.message = message;
    [APOpenAPI sendReq:request];
}

/// APOpenAPIDelegate
- (void)onResp:(APBaseResp *)resp {
    
    /// 检查数据
    if (![DryAlishare sharedInstance].respBlock) {
        return;
    }
    
    /// 获取返回码，回调分享结果
    NSInteger respCode = resp.errCode;
    if (respCode == APSuccess) {
        [DryAlishare sharedInstance].respBlock(kDryAlishareCodeSuccess);
    }else if (respCode == APErrCodeUserCancel) {
        [DryAlishare sharedInstance].respBlock(kDryAlishareCodeUserCancel);
    }else if (respCode == APErrCodeSentFail) {
        [DryAlishare sharedInstance].respBlock(kDryAlishareCodeSendFail);
    }else if (respCode == APErrCodeAuthDeny) {
        [DryAlishare sharedInstance].respBlock(kDryAlishareCodeAuthDeny);
    }else {
        [DryAlishare sharedInstance].respBlock(kDryAlishareCodeUnknown);
    }
    
    /// 清理Block
    [DryAlishare sharedInstance].respBlock = nil;
}

@end
