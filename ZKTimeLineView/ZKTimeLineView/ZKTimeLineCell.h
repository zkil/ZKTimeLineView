//
//  ZKTimeLineCell.h
//  ZKTimeLineView
//
//  Created by pang on 2017/6/7.
//  Copyright © 2017年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKTimeLineCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *leftLine;
@property (weak, nonatomic) IBOutlet UIView *rightLine;
@property (weak, nonatomic) IBOutlet UIImageView *numBgIV;
@property (weak, nonatomic) IBOutlet UILabel *numberLab;
@property (weak, nonatomic) IBOutlet UILabel *textLab;


@end
