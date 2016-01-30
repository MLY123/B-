//
//  CustomTabBarViewController.m
//  自定义TabBar
//
//  Created by lanouhn on 16/1/29.
//  Copyright © 2016年 孟刘扬. All rights reserved.
//

#import "CustomTabBarViewController.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kHeight 60  // 下方item视图的高度
#define kHeightOfBottomView kHeight - 12  // 显示的下方视图的高度
@interface CustomTabBarViewController ()
@property (nonatomic,strong)NSMutableArray *btnArr;  // button数组
@property (nonatomic,strong)NSMutableArray *labelArr;  // label数组
@property (nonatomic,assign)NSInteger indexOfDisplayView;//当前显示的视图的视图控制器
@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(instancetype)initWithViewControllers:(NSArray *)viewControllers{
     self = [super init];
     if (self) {
          self.viewControllers = [NSArray arrayWithArray:viewControllers];
               //初始化数组
          [self initArray];
               //布局子视图
          [self setSubViews];
     }

     return self;
}
-(void)initArray{
     self.btnArr = [NSMutableArray arrayWithCapacity:0];
     self.labelArr = [NSMutableArray arrayWithCapacity:0];


}
-(void)setSubViews{
          //创建底层透明的view
     UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - kHeight, kScreenWidth, kHeight)];
     view.backgroundColor = [UIColor clearColor];
          //创建底层不透明的小一点的view
     UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(12, kScreenHeight - kHeightOfBottomView, kScreenWidth, kHeightOfBottomView)];
     [view addSubview:bottomView];
     [self.view addSubview:view];
     float kWidth = kScreenWidth / self.viewControllers.count;
     for (int i = 0; i < self.viewControllers.count; i ++) {
               // 创建btn
          UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
          btn.frame = CGRectMake((kWidth - 25) / 2 + kWidth * i, 17, 25, 25);
          btn.tintColor = [UIColor blackColor];
          [view addSubview:btn];
          [self.btnArr addObject:btn];
               // btn的点击事件
          [btn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
          
               // 创建label
          UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5 + kWidth * i, 42, kWidth - 10, kHeightOfBottomView - 30)];
          label.text = @"test";
          label.textAlignment = NSTextAlignmentCenter;
          [view addSubview:label];
          [self.labelArr addObject:label];
               // 将中间的btn设置的大一点
          if (i == self.viewControllers.count / 2) {
               btn.transform = CGAffineTransformScale(btn.transform, 1.8, 1.8);
               btn.transform = CGAffineTransformTranslate(btn.transform, 0, -7);
          }

     }
     
          //修改传进来的VC的view的高度
     [self modifyHeightOfView];
          //设置下标为0的视图控制器的视图显示
     self.indexOfDisplayView = 0;
     UIViewController *vc = self.viewControllers[0];
     vc.view.hidden = NO;
     UIButton *btn = self.btnArr[0];
     btn.selected = YES;
}
/**给button添加点击事件*/
-(void)handleAction:(UIButton *)sender{
    NSInteger index = [self.btnArr indexOfObject:sender];
          //如果点击的btn对应的视图控制器的视图
     if (index == self.indexOfDisplayView) {
          return;
     }
     UIButton *btn = self.btnArr[self.indexOfDisplayView];//取出正在显示的view所在的试图控制器对应的btn
     btn.selected = NO;
     UIViewController *vc = self.viewControllers[self.indexOfDisplayView];
          //取出当前正在显示的Vc
     vc.view.hidden = YES;//使其隐藏
     sender.selected = YES;//将当前被选中的btn的状态置为被选中的状态
     UIViewController *newVC = self.viewControllers[index];
     newVC.view.hidden = NO;
     self.indexOfDisplayView = index;//当前正在显示的VC的下标
     

}
/**修改传进来的vc的view的高度*/
-(void)modifyHeightOfView{
     CGRect frame = self.view.frame;
     frame.size.height -= kHeightOfBottomView;
     for (UIViewController *vc in self.viewControllers) {
          vc.view.frame = frame;//改变高度
          vc.view.hidden = YES;//隐藏
          [self.view insertSubview:vc.view atIndex:0];//添加到父视图
     }

}
     /**在setter方法里为btn添加图片*/
-(void)setImagesNameArr:(NSArray *)imagesNameArr{
     if (_imagesNameArr != imagesNameArr) {
          _imagesNameArr = imagesNameArr;
               //为btn添加图片
          [self addImageForbtn];
     }

}
-(void)addImageForbtn{
[self.imagesNameArr enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
     UIButton *btn = self.btnArr[idx];
     UIImage *image = [UIImage imageNamed:obj];
     [btn setImage:image forState:UIControlStateNormal];
     image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     [btn setImage:image forState:UIControlStateSelected];
}];

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
