//
//  ViewController.m
//  NetRequest
//
//  Created by Jerry on 16/2/15.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "NetRequest.h"
#import "NetRequestManager.h"
#import "AFNetworking.h"

#import "BaseObject.h"
#import "IndexObject.h"

@interface ViewController ()


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[NetRequestManage sharedInstance] getIndexForRequestColumn:@""
//                                                netRequestBlock:^(NetRequest *netRequest, id date) {
//                                                    
//                                                }];
    
    

//    UIButton *btnLogin;
//    
//    UIImage *ImgIcon;
//    
//    UITableView *tabViewList;
//    
//    UITabBar *tabBarName;
//    
//    UIScrollView *scrollViewName;
//    
//    UIColor *colorName;
//    
//    UILabel *labName;
//    
//    UIView *viewName;
//    
//    UIFont *fontName;
    
    NSString *strUrl = [NSString stringWithFormat:@"/news/index"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"news" forKey:@"column"];
    
    AFHTTPSessionManager *manager = [[NetRequestManager sharedInstance] creatAFHTTPSessionManager];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
