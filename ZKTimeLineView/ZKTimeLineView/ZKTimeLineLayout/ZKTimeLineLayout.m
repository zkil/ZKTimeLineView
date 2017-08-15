//
//  ZKTimeLineLayout.m
//  ZKTimeLineView
//
//  Created by pang on 2017/8/14.
//  Copyright © 2017年 zk. All rights reserved.
//

#import "ZKTimeLineLayout.h"
@interface ZKTimeLineLayout()


@property (nonatomic,strong) NSMutableArray *attributesArr; //布局数组

@property (nonatomic) CGSize contentSize;
@property (nonatomic) UIEdgeInsets edgeInset;
//@property (nonatomic) CGFloat rowSpacing;  //暂时不换行
@property (nonatomic) CGFloat columnSpacing;

@property (nonatomic) CGPoint origin;

@end;

@implementation ZKTimeLineLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    [self.attributesArr removeAllObjects];
    
    NSInteger section = 0;  //预留
    NSInteger count = [self.collectionView numberOfItemsInSection:section];
    
    if (count == 0) {
        self.contentSize = CGSizeZero;
        return;
    }
    
    self.origin = CGPointMake(self.edgeInset.left, self.edgeInset.top);
    
    
    for (int i = 0; i < count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:section]];
        [self.attributesArr addObject:attrs];
    }
    
}

//每一个cell的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
//    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    //设置了contentWidth的话，平分宽
//    if (self.delegate && [self.delegate respondsToSelector:@selector(contentWidthWithTimeLineLayout:)]) {
//        CGFloat width = [self.delegate contentWidthWithTimeLineLayout:self] / count;
//        size.width = width;
//        
//        //更新高度
//        //            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
//        //            cell.frame = CGRectMake(0, 0, size.width, size.height);
//        //            size = [[self.collectionView cellForItemAtIndexPath:indexPath] systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//        
//    }
//
//    //设置了contentHeight的话
//    if (self.delegate && [self.delegate respondsToSelector:@selector(contentHeightWithTimeLineLayout:)]) {
//        CGFloat height = [self.delegate contentHeightWithTimeLineLayout:self];
//        size.height = height;
//    }
    
    CGSize size = CGSizeMake(self.contentSize.width / count, self.contentSize.height);
    attrs.frame = CGRectMake(self.origin.x, self.origin.y, size.width, size.height);
    
    //最后一个
    CGFloat spacing = indexPath.row == count - 1? 0 : self.columnSpacing;
    CGPoint origin = self.origin;
    origin.x = origin.x + size.width + spacing;
    self.origin = origin;

    return attrs;
}

- (CGSize)collectionViewContentSize {
    return self.contentSize;
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesArr;
}

/*
 在需要更新layout时，需要给当前layout发送
 1)-invalidateLayout， 该消息会立即返回，并且预约在下一个loop的时候刷新当前layout
 2)-prepareLayout，
 3)依次再调用-collectionViewContentSize和-layoutAttributesForElementsInRect来生成更新后的布局。
 
 */

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

#pragma -mark- getter

- (CGSize)contentSize {
    if (self.delegate && [self.delegate respondsToSelector:@selector(contentSizeWithTimeLineLayout:)]) {
        _contentSize = [self.delegate contentSizeWithTimeLineLayout:self];
    }
    return _contentSize;
}

- (NSMutableArray *)attributesArr {
    if (_attributesArr == nil) {
        _attributesArr = [NSMutableArray new];
    }
    return _attributesArr;
}

- (UIEdgeInsets)edgeInset {
    if (self.delegate && [self.delegate respondsToSelector:@selector(edgeInsetWithTimeLineLayout:)]) {
        return [self.delegate edgeInsetWithTimeLineLayout:self];
    } else {
        return _edgeInset;
    }
}

//- (CGFloat)rowSpacing {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(rowSpacingWithTimeLineLayout:)]) {
//        return [self.delegate rowSpacingWithTimeLineLayout:self];
//    } else {
//        return _rowSpacing;
//    }
//}

- (CGFloat)columnSpacing {
    if (self.delegate && [self.delegate respondsToSelector:@selector(columnSpacingWithTimeLineLayout:)]) {
        return [self.delegate columnSpacingWithTimeLineLayout:self];
    } else {
        return _columnSpacing;
    }
}

@end
