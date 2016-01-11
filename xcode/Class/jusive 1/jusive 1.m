
//
//  jusive 1.m
//  xcode
//
//  Created by Jusive on 16/1/9.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "jusive 1.h"
#import "jusive 2.h"
#import "jusive 3.h"
#import "jusive 4.h"
#import "jusive 5.h"
#import "jusive 6.h"

@implementation jusive_1

-(void)viewDidLoad{
    [self addChildViewController];
}
-(void)VC:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName{
  
    self.tabBar.tintColor = [UIColor orangeColor];
    VC.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    UINavigationController *Nav = [[UINavigationController alloc]initWithRootViewController:VC];
    [self addChildViewController:Nav];
}

-(void)addChildViewController{
    jusive_2 *j2 = [jusive_2 new];
    jusive_3 *j3 = [jusive_3 new];
    jusive_4 *j4 = [jusive_4 new];
    jusive_5 *j5 = [jusive_5 new];
    jusive_6 *j6 = [jusive_6 new];
    [self VC:j2 title:@"J2" imageName:@"tabbar_home"];
    [self VC:j3 title:@"J3" imageName:@"tabbar_message_center"];
    [self VC:j4 title:@"J4" imageName:@"tabbar_profile"];
    [self VC:j5 title:@"J5" imageName:@"tabbar_discover"];
    [self VC:j6 title:@"J6" imageName:@"tabbar_compose_icon_add"];
}
@end
