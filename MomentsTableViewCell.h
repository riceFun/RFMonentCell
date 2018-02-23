//
//  MomentsTableViewCell.h
//  RFMonentCell
//
//  Created by 鲍帆 on 2017/1/20.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MomentViewModel;
@interface MomentsTableViewCell : UITableViewCell

@property (nonatomic,strong) NSMutableArray *moments;
@property (nonatomic,strong) MomentViewModel *momentFrames;

+ (instancetype)momentsTableViewCellWithTableView:(UITableView *)tableView;

@end
