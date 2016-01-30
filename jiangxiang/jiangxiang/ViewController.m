//
//  ViewController.m
//  jiangxiang
//
//  Created by lanouhn on 16/1/28.
//  Copyright © 2016年 孟刘扬. All rights reserved.
//

#import "ViewController.h"
#import "ScrollCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
     [super viewDidLoad];
     
     UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
     self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 104, kWidth, kHeight - 104) collectionViewLayout:layout];
     
     // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

     return 1;
     
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

     return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     ScrollCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Scroll" forIndexPath:indexPath];
     return cell;

}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
     HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
     return headerView;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

     return CGSizeMake(100, 200);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
     if (section == 1) {
          return CGSizeMake(400, 200);
     }
     return CGSizeMake(0, 0);
}
- (void)didReceiveMemoryWarning {
     [super didReceiveMemoryWarning];
     // Dispose of any resources that can be recreated.
}

@end
