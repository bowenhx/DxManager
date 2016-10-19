//
//  ANet.h
//  ADemo
//
//  Created by ligb on 16/4/13.
//  Copyright © 2016年 hongyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class BNetData;



static NSString * const errServe = @"連接伺服出現錯誤，請稍後再嘗試";
static NSString * const errNet   = @"當前網絡不可用請檢查網絡連接";

/**
 *  单个进度显示
 */
typedef void (^PrecentBlock)(float precent);

/**
 *  下载完成后返回（当下载错误是，提供response 提供下载的结果，baseData 返回数据json/img, err 判断下载状态）
 */
typedef void (^CompletionBlock)(BNetData *model, NSString *netErr);

@interface ANet : NSObject

@property(nonatomic,copy)PrecentBlock taskPrecent;

/**
 *  单例
 */
+ (ANet *)share;

/**
 *  get 单个任务
 *
 *  @param url        地址
 *  @param precent    进度回调
 *  @param completion 完成回调
 */
- (void)get:(NSString *)url
 completion:(CompletionBlock)completion;


/**
 *  gets 批量任务
 *
 *  @param urls        地址数组
 *  @param precent     进度回调
 *  @param completion  完成回调
 */
- (void)gets:(NSArray *)urls
    precent:(PrecentBlock)precentBlock
 completion:(CompletionBlock)completion;


/**
 *  post 单个任务 （无进度）
 *
 *  @param url        地址
 *  @param params     参数
 *  @param completion 完成回调
 */

- (void)post:(NSString *)url
      params:(NSDictionary *)params
  completion:(CompletionBlock)completion;

/**
 *  post 单个任务 （有进度，需要的话自己管理）
 *
 *  @param url        地址
 *  @param params     参数
 *  @param precent    进度回调
 *  @param completion 完成回调
 */
- (void)post:(NSString *)url
      params:(NSDictionary *)params
     precent:(PrecentBlock)precentBlock
  completion:(CompletionBlock)completion;


/**
 *  posts 批量任务
 *
 *  @param urls       地址
 *  @param params     参数
 *  @param precent    进度回调
 *  @param completion 完成回调
 */
- (void)posts:(NSArray *)urls
      params:(NSDictionary *)params
     precent:(PrecentBlock)precentBlock
  completion:(CompletionBlock)completion;

/**
 *  upload  普通单个上传任务
 *
 *  @param url        地址
 *  @param params     参数
 *  @param image      图片
 *  @param precent    进度回调
 *  @param completion 完成回调
 */
- (void)upload:(NSString *)url
        params:(NSDictionary *)params
         image:(UIImage *)image
       precent:(PrecentBlock)precentBlock
    completion:(CompletionBlock)completion;


/**
 *  upload 批量上传任务
 *
 *  @param url        地址
 *  @param params     参数
 *  @param filePath   图片路径数组
 *  @param precent    进度回调
 *  @param completion 完成回调
 */
- (void)upload:(NSString *)url
        params:(NSDictionary *)params
         files:(NSArray *)files
       precent:(PrecentBlock)precentBlock
    completion:(CompletionBlock)completion;


#pragma mark 检查网络连接
- (void)checkNetworkBlock:(void (^)(NSString *netMeg , BOOL status))block;

@end



@interface NSURL (NSURL_Ex)
/**
 * 返回组装后的URL
 */
+ (NSURL *)urlWithMutableString:(NSString *)str;
/**
 *  给url追加字段如版本号，设备类型等
 */
+ (NSString *)addBuildRequestUrl:(NSString *)addUrl;

@end


@interface NSMutableURLRequest (NSURLRequest_Extension)
+ (NSMutableURLRequest *)request:(NSString *)url params:(NSDictionary *)dic;
+ (NSMutableURLRequest *)requestForUpload:(NSString *)url andFiles:(NSArray *)files params:(NSDictionary *)dic type:(NSString *)fileType;
@end