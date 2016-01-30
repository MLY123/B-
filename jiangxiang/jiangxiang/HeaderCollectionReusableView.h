//
//  HeaderCollectionReusableView.h
//  jiangxiang
//
//  Created by lanouhn on 16/1/29.
//  Copyright © 2016年 孟刘扬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderCollectionReusableView : UICollectionReusableView
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImg1;
@property (weak, nonatomic) IBOutlet UIImageView *photoImg2;
@property (weak, nonatomic) IBOutlet UIImageView *photoImg3;

@end
