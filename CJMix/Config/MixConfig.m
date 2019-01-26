//
//  MixConfig.m
//  CJMix
//
//  Created by ChenJie on 2019/1/25.
//  Copyright © 2019 Chan. All rights reserved.
//

#import "MixConfig.h"


@interface MixConfig () {
    NSArray <NSString *>* _legalClassFrontSymbols;
    NSArray <NSString *>* _legalClassBackSymbols;
}

@end


@implementation MixConfig

+ (instancetype)sharedSingleton {
    static MixConfig *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [MixConfig sharedSingleton];
}

- (id)copyWithZone:(nullable NSZone *)zone {
    return [MixConfig sharedSingleton];
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    return [MixConfig sharedSingleton];
}

- (NSString *)mixPrefix {
    if (!_mixPrefix) {
        _mixPrefix = @"Mix";
    }
    return _mixPrefix;
}

- (NSArray <NSString *>*)systemPrefixs {
    if (!_systemPrefixs) {
        _systemPrefixs = @[@"UI",@"NS",@"CA"];
    }
    return _systemPrefixs;
}

- (NSArray <NSString *>*)legalClassFrontSymbols {
    if (!_legalClassFrontSymbols) {
        _legalClassFrontSymbols = @[@" ",@",",@"(",@")",@"\n",@"[",@"<"];
    }
    return _legalClassFrontSymbols;
}

- (NSArray <NSString *>*)legalClassBackSymbols {
    if (!_legalClassBackSymbols) {
        _legalClassBackSymbols = @[@" ",@"\n",@"(",@")",@"<",@"*",@";",@",",@":",@"{"];
    }
    return _legalClassBackSymbols;
}

- (NSArray <NSString *>*)shieldPaths {
    if (!_shieldPaths) {
        _shieldPaths = @[];
    }
    return _shieldPaths;
}

@end