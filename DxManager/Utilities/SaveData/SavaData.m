//
//  SavaData.m
//  CarMobile
//
//  Created by Guibin on 14-4-21.
//  Copyright (c) 2014年 com.mobile-kingdom.bkapps All rights reserved.
//

#import "SavaData.h"
#import "AppDefine.h"

@implementation SavaData

static SavaData * _shareInstance = nil;

+ (SavaData *)shareInstance{
    if (!_shareInstance) {
        _shareInstance = [[SavaData alloc] init];
    }
    return _shareInstance;
}

+ (UIColor *)getColor:(NSString *)hexColor alpha:(CGFloat)alpha{
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:alpha];
}
+ (UIColor *)randomColor
{
    
    CGFloat hue = ( arc4random() / (CGFloat)RAND_MAX ); //0.0 to 1.0
    
    CGFloat saturation = ( arc4random() / (CGFloat)RAND_MAX); // 0.5 to 1.0,away from white
    
    CGFloat brightness = ( arc4random() / (CGFloat)RAND_MAX ); //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (BOOL)isStringBlank:(NSString *)string {
    if ([string isKindOfClass:[NSNull class]]) return YES;
    if (string ==nil && [string length] == 0)return YES;
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) return YES;
    return NO;
}

- (NSString *)usidString{
    NSString *userid =  [self printDataStr:USER_INFO_KEY];
    if ([self isStringBlank:userid]) {
        return @"";
    }else
        return userid;
}
- (NSString *)tokenString{
    NSString *appToken = [self printDataStr:TOKEN_KEY];
    if ([self isStringBlank:appToken]) {
        return @"";
    }else
        return appToken;
}

-(NSString *)currentUid {
    return [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:USER_INFO_KEY]];
    //    return [[NSUserDefaults standardUserDefaults] stringForKey:USER_INFO_KEY];
}

-(NSMutableDictionary *)dataForUser:(NSString *)uid
{
    if (uid.length > 0) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:uid]];
        if (dict != nil) {
            return dict;
        } else {
            return [NSMutableDictionary dictionary];
        }
    }
    return nil;
}

//保存bool值类型
- (void)savaDataBool:(BOOL)dataBool KeyString:(NSString *)key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([key isEqualToString:USER_INFO_KEY]) {
        
        [defaults setBool:dataBool forKey:key];
        
    }
    NSMutableDictionary *dict = [self dataForUser:[self currentUid]];
    if (dict) {
        [dict setValue:[NSNumber numberWithBool:dataBool] forKey:key];
        [defaults setValue:dict forKey:[self currentUid]];
    } else {
        [defaults setBool:dataBool forKey:key];
    }
    [defaults synchronize];
    
    
}

- (BOOL)printBoolData:(NSString *)key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dict = [self dataForUser:[self currentUid]];
    if (dict) {
        return [[dict objectForKey:key] boolValue];
    } else {
        return [defaults boolForKey:key];
    }
    
}
//保存nsinteger
- (void)savaDataInteger:(NSInteger)dataInt KeyString:(NSString*)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([key isEqualToString:USER_INFO_KEY]) {
        [defaults setInteger:dataInt forKey:key];
    }
    NSMutableDictionary *dict = [self dataForUser:[self currentUid]];
    if (dict) {
        [dict setValue:[NSNumber numberWithInteger:dataInt] forKey:key];
        [defaults setValue:dict forKey:[self currentUid]];
    } else {
        [defaults setInteger:dataInt forKey:key];
    }
    [defaults synchronize];
}
- (NSInteger)printDataInteger:(NSString*)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dict = [self dataForUser:[self currentUid]];
    if (dict) {
        return [[dict objectForKey:key] integerValue];
    } else {
        return [defaults integerForKey:key];
    }
}

//保存字符串类型
- (void)savadataStr:(NSString*)dataStr KeyString:(NSString*)key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([key isEqualToString:USER_INFO_KEY]) {//保存用户ID
        
        [defaults setValue:dataStr forKey:key];
        
    }
    NSMutableDictionary *dict = [self dataForUser:[self currentUid]];
    if (dict) {//用户登录的情况下，按照用户ID存储
        [dict setValue:dataStr forKey:key];
        [defaults setValue:dict forKey:[self currentUid]];
    } else {//用户没登录的情况下，没ID存储(像注册里面的存储)
        [defaults setValue:dataStr forKey:key];
    }
    [defaults synchronize];
}

- (NSString*)printDataStr:(NSString*)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dict = [self dataForUser:[self currentUid]];
    if (dict) {
        return [dict objectForKey:key];
    } else {
        return [defaults objectForKey:key];
    }
}

//保存数组类型
- (void)savaArray:(NSMutableArray *)dataAry KeyString:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dict = [self dataForUser:[self currentUid]];
    if (dict) {
        [dict setValue:dataAry forKey:key];
        [defaults setValue:dict forKey:[self currentUid]];
    } else {
        [defaults setValue:dataAry forKey:key];
    }
    [defaults synchronize];
}

- (NSMutableArray*)printDataAry:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dict = [self dataForUser:[self currentUid]];
    if (dict) {
        return [NSMutableArray arrayWithArray:[dict objectForKey:key]];
    } else {
        return [NSMutableArray arrayWithArray:[defaults objectForKey:key]];
    }
}

//保存字典类型
- (void)savaDictionary:(NSDictionary *)dataDic keyString:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString * uid = [self currentUid];
    NSString *str = [NSString stringWithFormat:@"%@_%@",key,[self currentUid]];
    if (uid) {
        [defaults setObject:dataDic forKey:str];
    } else {
        [defaults setObject:dataDic forKey:key];
    }
    [defaults synchronize];
}

- (NSMutableDictionary*)printDataMutableDic:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [NSString stringWithFormat:@"%@_%@",key,[self currentUid]];
    NSDictionary *dict = [defaults dictionaryForKey:str];
    NSMutableDictionary *result = nil;
    if (dict) {
        result = [NSMutableDictionary dictionaryWithDictionary:[dict objectForKey:key]];
    } else {
        result = [NSMutableDictionary dictionaryWithDictionary:[defaults objectForKey:key]];
    }
    return result == nil ? [NSMutableDictionary dictionary] : result;
}

- (NSDictionary*)printDataDic:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uid = [self currentUid];
    NSString *str = [NSString stringWithFormat:@"%@_%@",key,[self currentUid]];
    NSDictionary *dict = nil;//[NSDictionary dictionary];
    if (uid) {
        dict = [defaults dictionaryForKey:str];
        
    }else{
        dict = [defaults dictionaryForKey:key];
    }
    return dict;
}
//删除字典
- (void)removeDataDic:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uid = [self currentUid];
    NSString *str = [NSString stringWithFormat:@"%@_%@",key,uid];
    if (uid) {
        [defaults removeObjectForKey:str];
    }else{
        [defaults removeObjectForKey:key];
    }
    [defaults synchronize];
}
//把数组写入文件
+(void) writeArrToFile:(NSArray *)arr FileName:(NSString *)file
{
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths    objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:file];
    
    [arr writeToFile:filename  atomically:YES];
}

//解析文件得到数组
+(NSMutableArray *) parseArrFromFile:(NSString *)file
{
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path=[paths   objectAtIndex:0];
	NSString *filename=[path stringByAppendingPathComponent:file];
	NSMutableArray *array= [[NSMutableArray alloc] initWithContentsOfFile:filename];
	return array;
}
//把字典写入文件
+(BOOL) writeDicToFile:(NSDictionary *)dic FileName:(NSString *)file
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:file];
    BOOL isFinish = [dic writeToFile:filename  atomically:YES];
    NSLog(@"写入本地文件状态为： %d",isFinish);
    return isFinish;
}
//解析文件得到字典
+(NSDictionary *)parseDicFromFile:(NSString *)file
{
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path=[paths objectAtIndex:0];
	NSString *filename=[path stringByAppendingPathComponent:file];
	NSMutableDictionary *dic= [NSMutableDictionary dictionaryWithContentsOfFile:filename];
	return dic;
}
+ (NSDateFormatter *)userDateFormatter
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return formatter;
}

+ (NSString *)convertTimestempToDateWithString:(NSString *)timeStemp{
    NSTimeInterval interval = [timeStemp doubleValue] / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [self userDateFormatter];

    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    return dateStr;
}

//获取当前时间 年月日
+ (NSString *)getTodyDate
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [self userDateFormatter];
    
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}
+ (NSString *)getLibraryFilePathManager
{
    //在Library下的创建用户文件夹
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *userFile = [NSString stringWithFormat:@"User_%@",USERID];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:userFile];
    return  path;
}
//存储图片路径
+ (NSString *)saveImagePath:(UIImage *)image
{
    //先创建用户文件夹，再在用户文件夹存入要图片文件
    NSString *path = [[self getLibraryFilePathManager] stringByAppendingPathComponent:@"UpImages"];
    
    //如果不存在则创建临时存储目录
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *error;
    if(![fileManager fileExistsAtPath:path]){
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
    NSString *tempName = [NSString stringWithFormat:@"img_%d.jpg",arc4random_uniform(10000)];
    path = [path stringByAppendingPathComponent:tempName];
    //保存图片文件
    BOOL isSave = [UIImageJPEGRepresentation(image, 0.7) writeToFile:path options:NSAtomicWrite error:&error];
    NSLog(@"图片保存状态 = %d",isSave);
    return tempName;
}
/**
 *  获取图片路径
 *
 */
+ (NSString *)getImagePath:(NSString *)file{
    //先创建用户文件夹，再在用户文件夹存入要图片文件
    NSString *path = [[[self getLibraryFilePathManager] stringByAppendingPathComponent:@"UpImages"] stringByAppendingPathComponent:file];
    return path;
}
+ (BOOL)removeImagePath
{
    //删除要上传的图片文件夹
    NSString *path = [[self getLibraryFilePathManager] stringByAppendingPathComponent:@"UpImages"];
    
    //删除上传图片文件存储目录
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *error;
    if([fileManager fileExistsAtPath:path]){
        BOOL succeed = [fileManager removeItemAtPath:path error:&error];
        NSLog(@"图片文件夹删除成功");
        return succeed;
    }
    return NO;
}

+ (NSString *)imageFilePath:(NSString *)pathName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *savePath = [[SavaData getLibraryFilePathManager] stringByAppendingPathComponent:pathName];
    if (![fileManager fileExistsAtPath:savePath]) {
        [fileManager createDirectoryAtPath:savePath withIntermediateDirectories:YES attributes:nil error:nil];
    }else
    {
        return @"0";
    }
    return savePath;
}
//表情文件存储目录
+ (NSString *)smileyFilePath:(NSString *)file
{
    /**
     *  创建Library下载本地缓存路径
     *
     */
    NSString *libraryPath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:file];
    
    //如果不存在则创建临时存储目录
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    if(![fileManager fileExistsAtPath:libraryPath]){
        BOOL isFinish = [fileManager createDirectoryAtPath:libraryPath withIntermediateDirectories:YES attributes:nil error:&error];
         NSLog(@"写入文件状态：%d",isFinish);
    }else{
        //如果存在文件夹则删除文件夹
        if ( [fileManager removeItemAtPath:libraryPath error:&error] ) {
            NSLog(@"删除文件夹成功");
        }
        
    }
    return libraryPath;
}
@end
