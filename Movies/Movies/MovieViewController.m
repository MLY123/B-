//
//  MovieViewController.m
//  Movies
//
//  Created by lanouhn on 16/1/28.
//  Copyright © 2016年 孟刘扬. All rights reserved.
//

#import "MovieViewController.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#import "ScrollCollectionViewCell.h"

@interface MovieViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
     UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
     
     self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 104, kWidth, kHeight - 104) collectionViewLayout:layout];
     
     
     
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

     return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
     if (section == 1) {
          return 3;
     }else{
     return 6;
     }
     
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     if (indexPath.section == 1) {
          NSLog(@"&&&&&&&&");
          ScrollCollectionViewCell *Srollcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Scroll" forIndexPath:indexPath];
          
          return Srollcell;
     }
          UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
                    return cell;

     
     
     }
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
     if (indexPath.section == 1) {
          NSLog(@"*********");
          return CGSizeMake(400, 200);
     }else
          return CGSizeMake(100, 200);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
