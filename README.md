# ZKTimeLineView
## 简介
一个基于UICollectionView的横向时间线视图，支持Masonry，横竖屏切换，可自定义

## 效果图
![效果图](https://github.com/zkil/ZKTimeLineView/blob/master/timeline.gif?raw=true)  

### 使用方法
#### 导入 
导入文件夹 `ZKTimeLineView` 到工程  
`#import "ZKTimeLineView.h"`

#### 创建
```
    self.view.backgroundColor = [UIColor grayColor];
    
    ZKTimeLineView *lineView = [[ZKTimeLineView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:lineView];
```

#### 约束添加
```
[lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.center.mas_equalTo(self.view);
    }];

```

#### 设置数据
```
lineView.data = @[@"111",@"222",@"3333333333333",@"5555"];
```

#### 当前时间点
```
lineView.currentIndex = 2;
```

### 自定义方法
1.自定义一个 `UICollectionViewCell` ,可添加约束  
2.创建一个类继承 `ZKTimeLineView`  
3.重新方法
`- (instancetype)initWithFrame:(CGRect)frame`
并设置使用的cell
`[self registerNib:[UINib nibWithNibName:@"ZKTimeLineCell" bundle:nil] forCellWithReuseIdentifier:@"ZKTimeLineCell"];`  
4.重写已进行，正进行，未进行三个获取cell的方法，定制三种状态的样式  

```
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


```