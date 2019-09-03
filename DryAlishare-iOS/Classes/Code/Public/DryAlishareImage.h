//
//  DryAlishareImage.h
//  DryAlishare
//
//  Created by Ruiying Duan on 2019/4/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 图片分享对象
@interface DryAlishareImage : NSObject

/// 标题
@property (nonatomic, readwrite, nullable, copy) NSString *title;
/// 描述内容
@property (nonatomic, readwrite, nullable, copy) NSString *descrip;
/// 缩略图数据(thumbImgData和thumbImgUrl二选一)
@property (nonatomic, readwrite, nullable, strong) NSData *thumbImgData;
/// 缩略图路径
@property (nonatomic, readwrite, nullable, copy) NSString *thumbImgUrl;
/// 图片数据(imgData和imgUrl二选一)
@property (nonatomic, readwrite, nullable, strong) NSData *imgData;
/// 图片路径
@property (nonatomic, readwrite, nullable, copy) NSString *imgUrl;

@end

NS_ASSUME_NONNULL_END
