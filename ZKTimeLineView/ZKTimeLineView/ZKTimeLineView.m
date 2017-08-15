//
//  ZKTimeLineView.m
//  ZKTimeLineView
//
//  Created by pang on 2017/6/7.
//  Copyright © 2017年 zk. All rights reserved.
//

#import "ZKTimeLineView.h"
#import "ZKTimeLineCell.h"



@implementation ZKTimeLineView

- (instancetype)initWithFrame:(CGRect)frame {
    ZKTimeLineLayout *layout = [[ZKTimeLineLayout alloc] init];
    layout.delegate = self;

    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor whiteColor];
        _finishLineColor = [UIColor greenColor];
        _unfinishedLineColor = [UIColor grayColor];
        
        self.allowsSelection = NO;
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerNib:[UINib nibWithNibName:@"ZKTimeLineCell" bundle:nil] forCellWithReuseIdentifier:@"ZKTimeLineCell"];
    }
    return self;
}



#pragma -mark- setter

- (void)setData:(NSArray *)data {
    _data = data;
    
    [self reloadData];
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    
    [self reloadData];
}

#pragma -mark- ZKTimeLineLayoutDelegate

- (CGSize)contentSizeWithTimeLineLayout:(ZKTimeLineLayout *)timeLineLayput {
    return self.frame.size;
}

#pragma -amrk- UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    ZKTimeLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZKTimeLineCell" forIndexPath:indexPath];
//    cell.numberLab.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
//    cell.textLab.text = self.data[indexPath.row];
//    cell.numBgIV.highlighted = indexPath.row < self.currentIndex;
//
//    cell.leftLine.backgroundColor = indexPath.row <= self.currentIndex? self.finishLineColor :self.unfinishedLineColor;
//    cell.rightLine.backgroundColor = indexPath.row < self.currentIndex? self.finishLineColor : self.unfinishedLineColor;
//    cell.numberLab.hidden = indexPath.row < self.currentIndex;
//    return cell;
    
    if (indexPath.row < self.currentIndex) {
        return [self getFinishCellFromCollectionView:collectionView forIndexPath:indexPath];
    } else if (indexPath.row == self.currentIndex) {
        return [self getCurrentCellFromCollectionView:collectionView forIndexPath:indexPath];
    } else {
        return [self getUninishCellFromCollectionView:collectionView forIndexPath:indexPath];
    }
    
}

#pragma -mark- cell定制
//已完成cell定制
- (UICollectionViewCell *)getFinishCellFromCollectionView:(UICollectionView *) collectionView forIndexPath:(NSIndexPath *) indexPath {
    ZKTimeLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZKTimeLineCell" forIndexPath:indexPath];
    cell.numberLab.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    cell.textLab.text = self.data[indexPath.row];
    cell.numBgIV.highlighted = YES;
    cell.leftLine.backgroundColor = self.finishLineColor;
    cell.rightLine.backgroundColor = self.finishLineColor;
    cell.numberLab.hidden = YES;
    return cell;
}

//未完成cell定制
- (UICollectionViewCell *)getUninishCellFromCollectionView:(UICollectionView *) collectionView forIndexPath:(NSIndexPath *) indexPath {
    ZKTimeLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZKTimeLineCell" forIndexPath:indexPath];
    cell.numberLab.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    cell.textLab.text = self.data[indexPath.row];
    cell.numBgIV.highlighted = NO;
    cell.leftLine.backgroundColor = self.unfinishedLineColor;
    cell.rightLine.backgroundColor = self.unfinishedLineColor;
    cell.numberLab.hidden = NO;
    
    return cell;
}

//当前cell定制
- (UICollectionViewCell *)getCurrentCellFromCollectionView:(UICollectionView *) collectionView forIndexPath:(NSIndexPath *) indexPath {
    ZKTimeLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZKTimeLineCell" forIndexPath:indexPath];
    cell.numberLab.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    cell.textLab.text = self.data[indexPath.row];
    cell.numBgIV.highlighted = NO;
    cell.leftLine.backgroundColor = self.finishLineColor;
    cell.rightLine.backgroundColor = self.unfinishedLineColor;
    cell.numberLab.hidden = NO;
    
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
