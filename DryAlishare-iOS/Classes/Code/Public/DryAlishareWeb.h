//
//  DryAlishareWeb.h
//  DryAlishare
//
//  Created by Ruiying Duan on 2019/4/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 网页分享对象
@interface DryAlishareWeb : NSObject

/// 标题
@property (nonatomic, readwrite, nullable, copy) NSString *title;
/// 描述内容
@property (nonatomic, readwrite, nullable, copy) NSString *descrip;
/// 缩略图数据(thumbImgData和thumbImgUrl二选一)
@property (nonatomic, readwrite, nullable, strong) NSData *thumbImgData;
/// 缩略图路径
@property (nonatomic, readwrite, nullable, copy) NSString *thumbImgUrl;
/// 网页的url地址
@property (nonatomic, readwrite, nullable, copy) NSString *webUrl;

@end

NS_ASSUME_NONNULL_END
