//
//  HeaderCollectionReusableView.m
//  jiangxiang
//
//  Created by lanouhn on 16/1/29.
//  Copyright © 2016年 孟刘扬. All rights reserved.
//

#import "HeaderCollectionReusableView.h"

@implementation HeaderCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
     self = [super initWithFrame:frame];
     if (self) {
          self.ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 104, 400, 200)];
          _ScrollView.backgroundColor = [UIColor redColor];
          [self addSubview:self.ScrollView];
     }
     return self;
}
@end
