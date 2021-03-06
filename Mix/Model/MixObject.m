//
//  MixObject.m
//  Mix
//
//  Created by ChenJie on 2019/1/20.
//  Copyright © 2019 ChenJie. All rights reserved.
//

#import "MixObject.h"
#import "MixStringStrategy.h"
#import "../Strategy/MixJudgeStrategy.h"
#import "../Strategy/MixClassStrategy.h"

@implementation MixObject


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _classFile = [aDecoder decodeObjectForKey:@"classFile"];
        _hClasses = [aDecoder decodeObjectForKey:@"hClasses"];
        _mClasses = [aDecoder decodeObjectForKey:@"mClasses"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_classFile forKey:@"classFile"];
    [aCoder encodeObject:_hClasses forKey:@"hClasses"];
    [aCoder encodeObject:_mClasses forKey:@"mClasses"];
}

- (instancetype)initWithClassFile:(MixClassFile *)file {
    self = [super init];
    if (self) {
        _classFile = file;
        [self analyze];
    }
    return self;
    
}

- (void)analyze {
    
    [self setupClassWithFile:self.classFile.hFile isHeader:YES];
    [self setupClassWithFile:self.classFile.mFile isHeader:NO];
    
}

- (void)setupClassWithFile:(MixFile *)file isHeader:(BOOL)isHeader {
    
    if (!file ||!self.classFile) {
        return;
    }
    
    if (isHeader) {
        _hClasses = [NSArray arrayWithArray:[MixClassStrategy dataToClassName:file.data]];
    } else {
        _mClasses = [NSArray arrayWithArray:[MixClassStrategy dataToClassName:file.data]];
    }
    
}






@end
