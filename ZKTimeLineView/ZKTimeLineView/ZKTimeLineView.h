//
//  ZKTimeLineView.h
//  ZKTimeLineView
//
//  Created by pang on 2017/6/7.
//  Copyright © 2017年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKTimeLineLayout.h"
@interface ZKTimeLineView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,ZKTimeLineLayoutDelegate>
@property (nonatomic,strong) UIColor *finishLineColor; //完成线条颜色
@property (nonatomic,strong) UIColor *unfinishedLineColor; //未完成线条颜色

@property (nonatomic,strong) NSArray<NSString *> *data;
@property (nonatomic) NSInteger currentIndex; //当前时间点index


//已完成cell定制
- (UICollectionViewCell *)getFinishCellFromCollectionView:(UICollectionView *) collectionView forIndexPath:(NSIndexPath *) indexPath;
//未完成cell定制
- (UICollectionViewCell *)getUninishCellFromCollectionView:(UICollectionView *) collectionView forIndexPath:(NSIndexPath *) indexPath;
//当前cell定制
- (UICollectionViewCell *)getCurrentCellFromCollectionView:(UICollectionView *) collectionView forIndexPath:(NSIndexPath *) indexPath;
@end
