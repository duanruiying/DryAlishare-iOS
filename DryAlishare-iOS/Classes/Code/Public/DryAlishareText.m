//
//  DryAlishareText.m
//  DryAlishare
//
//  Created by Ruiying Duan on 2019/4/27.
//

#import "DryAlishareText.h"

#pragma mark - DryAlishareText
@implementation DryAlishareText

/// 构造
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _title = @"";
        _descrip = @"";
        _thumbImgData = nil;
        _thumbImgUrl = @"";
        _text = @"";
    }
    
    return self;
}

/// 析构
- (void)dealloc {

    _title = nil;
    _descrip = nil;
    _thumbImgData = nil;
    _thumbImgUrl = nil;
    _text = nil;
}

@end
