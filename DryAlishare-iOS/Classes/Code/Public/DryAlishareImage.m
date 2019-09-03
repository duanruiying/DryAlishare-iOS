//
//  DryAlishareImage.m
//  DryAlishare
//
//  Created by Ruiying Duan on 2019/4/27.
//

#import "DryAlishareImage.h"

#pragma mark - DryAlishareImage
@implementation DryAlishareImage

/// 构造
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _title = @"";
        _descrip = @"";
        _thumbImgData = nil;
        _thumbImgUrl = @"";
        _imgData = nil;
        _imgUrl = @"";
    }
    
    return self;
}

/// 析构
- (void)dealloc {
    
    _title = nil;
    _descrip = nil;
    _thumbImgData = nil;
    _thumbImgUrl = nil;
    _imgData = nil;
    _imgUrl = nil;
}

@end
