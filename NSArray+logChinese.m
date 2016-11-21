//
//  NSArray+logChinese.m
//  FCM
//
//  Created by Inspirr Mac on 16/9/23.
//  Copyright © 2016年 Google Inc. All rights reserved.
//

#import "NSArray+logChinese.h"

@implementation NSArray (logChinese)
//@implementation NSArray (Log)
/*
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString stringWithFormat:@"%lu (\n", (unsigned long)self.count];
    
    for (id obj in self) {
        [str appendFormat:@"\t%@, \n", obj];
    }
    
    [str appendString:@")"];
    return str;
}
*/

- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level{
    
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"(\n"];
    for (int i = 0; i < self.count; i++) {
        NSString *lastSymbol = (self.count == i + 1) ? @"":@",";
        id value = self[i];
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@%@\n",tab,[value descriptionWithLocale:locale indent:level + 1],lastSymbol];
        } else {
            [mStr appendFormat:@"\t%@%@%@\n",tab,value,lastSymbol];
        }
    }
    [mStr appendFormat:@"%@)",tab];
    return mStr;
    
}
@end
