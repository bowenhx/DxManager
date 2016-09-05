//
//  SavaData.h
//  CarMobile
//
//  Created by Guibin on 14-4-21.
//  Copyright (c) 2014年 com.mobile-kingdom.bkapps All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SavaData : NSObject

+ (SavaData *)shareInstance;


+ (UIColor *)getColor:(NSString *)hexColor alpha:(CGFloat)alpha;
+ (UIColor *)randomColor;//获取随机色

- (NSString *)usidString;
- (NSString *)tokenString;

//保存的bool值
- (void)savaDataBool:(BOOL)dataBool KeyString:(NSString*)key;
- (BOOL)printBoolData:(NSString*)key;

//保存nsinteger
- (void)savaDataInteger:(NSInteger)dataInt KeyString:(NSString*)key;
- (NSInteger)printDataInteger:(NSString*)key;

//保存NSString数据
- (void)savadataStr:(NSString*)dataStr KeyString:(NSString*)key;
- (NSString*)printDataStr:(NSString*)key;

//保存nsmutablearray
- (void)savaArray:(NSMutableArray*)dataAry KeyString:(NSString*)key;
- (NSMutableArray*)printDataAry:(NSString*)key;

//保存nsdictionary
- (void)savaDictionary:(NSDictionary*)dataDic keyString:(NSString*)key;
- (NSDictionary*)printDataDic:(NSString*)key;
- (NSMutableDictionary*)printDataMutableDic:(NSString *)key;
//删除字典
- (void)removeDataDic:(NSString *)key;

//把数组写入文件
+(void) writeArrToFile:(NSArray *)arr FileName:(NSString *)file;

//解析文件得到数组
+(NSMutableArray *) parseArrFromFile:(NSString *)file;

//把字典写入文件
+(BOOL) writeDicToFile:(NSDictionary *)dic FileName:(NSString *)file;

//解析文件得到字典
+(NSDictionary *)parseDicFromFile:(NSString *)file;

//将时间戳转化时间
+ (NSString *)convertTimestempToDateWithString:(NSString *)timeStemp;

//获取当前时间 年月日
+ (NSString *)getTodyDate;
//存储图片路径
+(NSString *)saveImagePath:(UIImage *)image;
/**
 *  获取图片路径
 *
 */
+ (NSString *)getImagePath:(NSString *)file;

//删除图片文件夹
+ (BOOL)removeImagePath;
+(NSString *)imageFilePath:(NSString *)pathName;

//表情文件存储目录
+ (NSString *)smileyFilePath:(NSString *)file;
@end
