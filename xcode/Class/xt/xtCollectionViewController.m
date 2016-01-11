
//
//  xtCollectionViewController.m
//  xcode
//
//  Created by Jusive on 16/1/10.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "xtCollectionViewController.h"
#import "xtcell.h"
#import "xtWebView.h"

@interface xtCollectionViewController ()
@property (nonatomic,strong)UIWebView *webview;
@property (nonatomic,assign) int clientSocket;
@property (nonatomic,strong )xtcell *cell;
@end
@implementation xtCollectionViewController
static NSString * Rcell = @"cell";

-(instancetype)init{
    //设置流水布局
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    //设置每一行的大小
    flowLayout.itemSize =[UIScreen mainScreen].bounds.size;
    //设置行间距
    flowLayout.minimumLineSpacing = 0;
    //设置水平滚动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    self.view.backgroundColor = [UIColor orangeColor];
    return [super initWithCollectionViewLayout:flowLayout];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     xtcell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:Rcell forIndexPath:indexPath];
    xtWebView *webView = [[xtWebView alloc] init];
     [cell addSubview:self.webview];
    cell.webview = webView;
//    self.webview.backgroundColor = [UIColor redColor];
//    cell.contentView.backgroundColor = indexPath.row % 2 ? [UIColor redColor] : [UIColor blueColor];
//      cell.contentView.backgroundColor = [UIColor orangeColor];
     return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.bounces = NO;
//    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    [self.collectionView registerClass:[xtcell class] forCellWithReuseIdentifier:Rcell];
}

@end
