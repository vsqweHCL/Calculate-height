//
//  ViewController.m
//  demo
//
//  Created by xuzhiyong on 2020/3/16.
//  Copyright © 2020 xxx. All rights reserved.
//

#import "ViewController.h"
#import "MoreViewController.h"

#import "LACollectionViewCell.h"

@interface ViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
MoreVcDelegate
>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewH;

@property (nonatomic, strong) NSMutableArray *dataM;
@end

CGFloat LAItemW = 0;
CGFloat LAItemH = 0;
CGFloat const LAColMargin = 0;
CGFloat const LARowMargin = 0;
CGFloat const LACol = 4;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    LAItemW = screenW/LACol;
    LAItemH = LAItemW;
    NSLog(@"LAItemW = %f",LAItemW);
    
    [self setupCollectionView];
    [self setupData];
}

- (void)setupCollectionView {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[LACollectionViewCell nib] forCellWithReuseIdentifier:[LACollectionViewCell reuseIdentifier]];
}
- (void)setupData {
    LAModel *m1 = [[LAModel alloc] init];
    m1.title = @"花呗";
    m1.isMore = NO;
    LAModel *m2 = [[LAModel alloc] init];
    m2.title = @"借呗";
    m2.isMore = NO;
    LAModel *m3 = [[LAModel alloc] init];
    m3.title = @"蚂蚁森林";
    m3.isMore = NO;
    LAModel *m4 = [[LAModel alloc] init];
    m4.title = @"蚂蚁乐园";
    m4.isMore = NO;
    LAModel *m5 = [[LAModel alloc] init];
    m5.title = @"哈罗单车";
    m5.isMore = NO;
    LAModel *m6 = [[LAModel alloc] init];
    m6.title = @"鬼知道什么";
    m6.isMore = NO;
    LAModel *m7 = [[LAModel alloc] init];
    m7.title = @"更多";
    m7.isMore = YES;
    [self.dataM addObjectsFromArray:@[m1,m2,m3,m4,m5,m6,m7]];
    
    [self.collectionView reloadData];
    self.collectionViewH.constant = ceilf(self.dataM.count/LACol)*LAItemH;
    NSLog(@"%f",self.collectionViewH.constant);
    
}
#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataM.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(LAItemW, LAItemH);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return LARowMargin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return LAColMargin;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[LACollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    cell.model = self.dataM[indexPath.item];
    cell.backgroundColor = indexPath.item%2==0?[UIColor greenColor]:[UIColor yellowColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LAModel *model = self.dataM[indexPath.item];
    NSLog(@"model = %@",model.title);
    if (model.isMore) {
        MoreViewController *vc = [[MoreViewController alloc] init];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

#pragma mark - MoreVcDelegate

- (void)addData {
    LAModel *m = [[LAModel alloc] init];
    m.title = @"不知道";
    m.isMore = NO;
    [self.dataM insertObject:m atIndex:0];
    [self.collectionView reloadData];
    
    self.collectionViewH.constant = ceilf(self.dataM.count/LACol)*LAItemH;
    NSLog(@"%f",self.collectionViewH.constant);
}
#pragma mark - Property

- (NSMutableArray *)dataM {
    if (_dataM == nil) {
        _dataM = [NSMutableArray array];
    }
    return _dataM;
}
@end
