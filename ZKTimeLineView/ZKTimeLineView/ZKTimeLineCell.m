//
//  ZKTimeLineCell.m
//  ZKTimeLineView
//
//  Created by pang on 2017/6/7.
//  Copyright © 2017年 zk. All rights reserved.
//

#import "ZKTimeLineCell.h"
#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation ZKTimeLineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (UICollectionViewLayoutAttributes*)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes*)layoutAttributes {
//    
//    [self setNeedsLayout];
//    
//    [self layoutIfNeeded];
//    
//    CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    //size.width = (kSCREEN_WIDTH < kSCREEN_HEIGHT? kSCREEN_WIDTH : kSCREEN_HEIGHT) /5 - 0.1;
//    NSLog(@"%@",NSStringFromCGSize(size));
//    CGRect cellFrame = layoutAttributes.frame;
//    
//    cellFrame.size = size;
//    
//    layoutAttributes.frame= cellFrame;
//    
//    return layoutAttributes;
//    
//}

@end
