//
//  DryAlishareWeb.m
//  DryAlishare
//
//  Created by Ruiying Duan on 2019/4/27.
//

#import "DryAlishareWeb.h"

#pragma mark - DryAlishareWeb
@implementation DryAlishareWeb

/// 构造
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _title = @"";
        _descrip = @"";
        _thumbImgData = nil;
        _thumbImgUrl = @"";
        _webUrl = @"";
    }
    
    return self;
}

/// 析构
- (void)dealloc {
    
    _title = nil;
    _descrip = nil;
    _thumbImgData = nil;
    _thumbImgUrl = nil;
    _webUrl = nil;
}

@end
