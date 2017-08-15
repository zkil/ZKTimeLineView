//
//  ZKTimeLineLayout.h
//  ZKTimeLineView
//
//  Created by pang on 2017/8/14.
//  Copyright © 2017年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZKTimeLineLayout;
@protocol ZKTimeLineLayoutDelegate<NSObject>

@required

//- (CGFloat)contentHeightWithTimeLineLayout:(ZKTimeLineLayout *)timeLineLayput;
//- (CGFloat)contentWidthWithTimeLineLayout:(ZKTimeLineLayout *)timeLineLayput;

/**
 内容大小
 */
- (CGSize)contentSizeWithTimeLineLayout:(ZKTimeLineLayout *)timeLineLayput;

@optional

//- (CGFloat)rowSpacingWithTimeLineLayout:(ZKTimeLineLayout *)timeLineLayput;

/**
 外边距
 */
- (UIEdgeInsets)edgeInsetWithTimeLineLayout:(ZKTimeLineLayout *)timeLineLayput;

/**
 每列间隔
 */
- (CGFloat)columnSpacingWithTimeLineLayout:(ZKTimeLineLayout *)timeLineLayput;

@end

@interface ZKTimeLineLayout : UICollectionViewLayout

@property (nonatomic,weak)id<ZKTimeLineLayoutDelegate> delegate;

@end
