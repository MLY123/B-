//
//  CustomTabBarViewController.h
//  自定义TabBar
//
//  Created by lanouhn on 16/1/29.
//  Copyright © 2016年 孟刘扬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarViewController : UIViewController
/*
 初始化方法
 */
-(instancetype)initWithViewControllers:(NSArray *)viewControllers;

/** 初始化之后想要改变tabbar控制的视图控制器可以使用此属性 */
@property (nonatomic,strong)NSArray *viewControllers;
/** btn上图片的名字的数组*/
@property (nonatomic,strong)NSArray *imagesNameArr;
@end
