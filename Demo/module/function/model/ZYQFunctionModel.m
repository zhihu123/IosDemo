//
//  ZYQFunctionModel.m
//  Demo
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2018/10/10.
//  Copyright © 2018年 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import "ZYQFunctionModel.h"

@implementation ZYQFunctionModel

+ (NSArray *)loadData {
    NSMutableArray *mutArr = [NSMutableArray array];
    for (NSDictionary *dic in [self createData]) {
        ZYQFunctionModel *model = [[ZYQFunctionModel alloc] init];
        model.title = dic[@"title"];
        model.introduction = dic[@"introduction"];
        model.nextVc = dic[@"nextVc"];
        [mutArr addObject:model];
    }
    
    return [mutArr copy];
}
+ (NSArray *)createData {
    NSArray *data = @[@{@"title":@"红点提醒功能",@"introduction":@"有关于项目中用到的红点操作", @"nextVc":@"ZYQBadgeController"},
                      @{@"title":@"健康数据健康",@"introduction":@"有关苹果的healthKit功能的使用", @"nextVc":@"ZYQHealthKitController"},
                      @{@"title":@"Runtime",@"introduction":@"有关Runtime的一些使用", @"nextVc":@"ZYQRuntimeController"},
                      @{@"title":@"加密解密",@"introduction":@"有关基本的一些加密、解密技术的使用，涉及到HASH、DES、AES、BASE64 、RSA", @"nextVc":@"ZYQEncryptionAndDecryptionController"},
                      @{@"title":@"文件操作",@"introduction":@"我们经常使用的关于文件的一些操作", @"nextVc":@"ZYQFileViewController"},
                      @{@"title":@"二维码、条形码的操作",@"introduction":@"我们用到的二维码生成、扫描 ， 条形码生成、扫描的封装", @"nextVc":@"ZYQQRCodeController"},
                      @{@"title":@"搜索的功能样式",@"introduction":@"我们经常使用到的搜索页面，添加标签功能也做了封装，可以单独拆开使用", @"nextVc":@"ZYQSearchController"},
                      @{@"title":@"修改app的图标",@"introduction":@"可以动态的修改app的图标，再搞活动的那天换成统一的主题", @"nextVc":@"ZYQChangeAppIconController"},
                      @{@"title":@"标签选择视图",@"introduction":@"我们可以在我们的项目中做一款特殊的选择标签功能", @"nextVc":@"ZYQSphereViewController"}
                      ];
    return data;
}

@end
