//
//  ENDECODE.m
//  encodeanddecodetest
//
//  Created by liwx on 13-12-27.
//  Copyright (c) 2013年 liwx. All rights reserved.
//

#import "ENDECODE.h"

@interface ENDECODE()

@end

@implementation ENDECODE

#pragma mark - 加解密
+ (void)encrptByFilePath:(NSString *)filePath
{
    Byte xor = 255;
    NSFileHandle *file = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    NSMutableData *buffer;
    NSInteger encryptLenght = 256;
    buffer = [NSMutableData dataWithData:[file readDataOfLength:encryptLenght]];
    Byte *testByte = (Byte *)[buffer bytes];
    Byte newBytes[encryptLenght];
    for(int i=0;i<[buffer length];i++) {
        Byte theByte = testByte[i];
        theByte = (Byte)theByte ^ xor;
        newBytes[i] = (Byte)theByte;
    }
    [buffer replaceBytesInRange:NSMakeRange(0, encryptLenght) withBytes:newBytes length:encryptLenght];
    [file seekToFileOffset:0];
    [file writeData:buffer];
    [file closeFile];
}

@end
