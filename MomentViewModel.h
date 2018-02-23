//
//  MomentViewModel.h
//  RFMonentCell
//
//  Created by 鲍帆 on 2017/1/20.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Moments;
@interface MomentViewModel : NSObject

/**
 *  数据模型
 */
@property (nonatomic ,strong) Moments *moment;

/**
 *  主体Frame
 */
@property (nonatomic ,assign) CGRect momentsBodyFrame;

//昵称Frame
@property (nonatomic ,assign) CGRect bodyNameFrame;
//头像Frame
@property (nonatomic ,assign) CGRect bodyIconFrame;
//时间Frame
@property (nonatomic ,assign) CGRect bodyTimeFrame;
//正文Frame
@property (nonatomic ,assign) CGRect bodyTextFrame;
//图片Frame
@property (nonatomic ,assign) CGRect bodyPhotoFrame;

/**
 *  工具条Frame
 */
@property (nonatomic, assign) CGRect momentsToolBarFrame;

//点赞Frame
@property (nonatomic ,assign) CGRect toolLikeFrame;
//评论Frame
@property (nonatomic ,assign) CGRect toolCommentFrame;

/**
 *  cell高度
 */
@property (nonatomic ,assign) CGFloat cellHeight;
@end
