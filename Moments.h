//
//  Moments.h
//  RFMonentCell
//
//  Created by 鲍帆 on 2017/1/20.
//  Copyright © 2017年 riceFun. All rights reserved.
//  数据模型

#import <Foundation/Foundation.h>

@interface Moments : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *comment_count;
@property (nonatomic, copy) NSString *like_count;
@property (nonatomic, strong) NSArray *photos;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)initWithDic:(NSDictionary *)dic;

+ (NSMutableArray *)moments;

@end
