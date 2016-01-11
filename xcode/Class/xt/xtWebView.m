//
//  xtWebView.m
//  xcode
//
//  Created by Jusive on 16/1/10.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "xtWebView.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
@implementation xtWebView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        [self loadBaidu];
    }
    return self;
}

- (void)loadBaidu {
    //连接百度服务器
    BOOL result = [self connect:@"61.135.169.125" port:80];
    if (!result) {
        NSLog(@"连接失败");
        return ;
    }
    NSLog(@"连接成功");
    NSString *request = @"GET / HTTP/1.1\r\n"
    "Host: www.baidu.com\r\n"
    "User-Agent: Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7"
    "Connection: keep-alive\r\n\r\n";
    //服务器返回的响应头 和响应体
    NSString *respose = [self sendAndRecv:request];
    NSLog(@"-----%@",request);
    close(self.clientSocket);
    
    NSRange rang = [respose rangeOfString:@"\r\n\r\n"];
    NSString *html = [respose substringFromIndex:rang.length +rang.location];
    
    [self loadHTMLString:html baseURL:[NSURL URLWithString:@"http://www.baidu.com"]];
}
-(BOOL)connect:(NSString *)ip port:(int)port{
    
    int clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    self.clientSocket = clientSocket;
    struct sockaddr_in addr;
    addr.sin_addr.s_addr = inet_addr(ip.UTF8String);
    addr.sin_family = AF_INET;
    addr.sin_port = htons(port);
    int result = connect(clientSocket, (const  struct  sockaddr *)&addr, sizeof(addr));
    if (result == 0) {
        return YES;
    }else{
        return NO;
    }
    
}
//发送和接收数据
-(NSString *)sendAndRecv:(NSString *)sendMsg{
    //向服务器发送数据
    const char *msg = sendMsg.UTF8String;
    ssize_t sendCount = send(self.clientSocket, msg, strlen(msg), 0);
    NSLog(@"发送的字节数%zd",sendCount);
    //接收服务器返回的数据
    uint8_t buffer[1024];
    NSMutableData *mData = [NSMutableData data];
    size_t recvCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
    [mData appendBytes:buffer length:recvCount];
    while (recvCount != 0) {
        recvCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
        NSLog(@"接收的字节数 %zd",recvCount);
        [mData appendBytes:buffer length:recvCount];
    }
    
    NSString *recvMsg = [[NSString alloc]initWithData:mData encoding:NSUTF8StringEncoding];
    return recvMsg;
}
@end
