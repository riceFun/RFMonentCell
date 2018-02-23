//
//  MomentsToolBarView.m
//  RFMonentCell
//
//  Created by 鲍帆 on 2017/1/20.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "MomentsToolBarView.h"
#import "MomentViewModel.h"
#import "Moments.h"
#import "PrefixHeader.pch"

@interface MomentsToolBarView ()

@property (nonatomic ,weak) UIButton *likeBtn;
@property (nonatomic ,weak) UIButton *commentBtn;

@end


@implementation MomentsToolBarView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加子控件
        [self setChildView];
        self.backgroundColor = [UIColor colorWithHexString:@"#55555"];
        self.layer.cornerRadius = 7.0;
        self.layer.masksToBounds = NO;
    }
    return self;
}

- (void)setChildView{
    //点赞
    UIButton *likeBtn = [[UIButton alloc] init];
    [likeBtn setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    [likeBtn setTitleColor:circleCellToolBarTintColor forState:UIControlStateNormal];
    likeBtn.titleLabel.font = circleCellToolBarTittleFont;
    [self addSubview:likeBtn];
    self.likeBtn = likeBtn;
    
    //评论
    UIButton *commentBtn = [[UIButton alloc] init];
    [commentBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    [commentBtn setTitleColor:circleCellToolBarTintColor forState:UIControlStateNormal];
    commentBtn.titleLabel.font = circleCellToolBarTittleFont;
    [self addSubview:commentBtn];
    self.commentBtn = commentBtn;
}

- (void)setMomentFrames:(MomentViewModel *)momentFrames{
    _momentFrames = momentFrames;
    self.likeBtn.frame = momentFrames.toolLikeFrame;
    [self.likeBtn setTitle:[NSString stringWithFormat:@" %@",momentFrames.moment.like_count] forState:UIControlStateNormal];
    
    self.commentBtn.frame = momentFrames.toolCommentFrame;
    [self.commentBtn setTitle:[NSString stringWithFormat:@" %@",momentFrames.moment.comment_count] forState:UIControlStateNormal];
}






























@end
