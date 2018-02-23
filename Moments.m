//
//  Moments.m
//  RFMonentCell
//
//  Created by 鲍帆 on 2017/1/20.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "Moments.h"

@implementation Moments

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        //KVC赋值
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}

+ (instancetype)initWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

+(NSMutableArray *)moments{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Moments.plist" ofType:nil];
    NSArray *dicArr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSDictionary *dic in dicArr) {
        Moments *moment = [Moments initWithDic:dic];
        [arr addObject:moment];
    }
    return arr;
}


@end
