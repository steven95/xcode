//
//  xtcell.m
//  xcode
//
//  Created by Jusive on 16/1/10.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "xtcell.h"
@interface xtcell ()


@end
@implementation xtcell

- (void)setWebview:(UIWebView *)webview {
    _webview = webview;
    [self.contentView addSubview:webview];

    NSLog(@"%@", webview);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView addSubview:self.webview];
    
    self.webview.frame = self.bounds;
}
@end
