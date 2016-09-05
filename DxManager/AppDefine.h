//
//  AppDefine.h
//  DxManager
//
//  Created by ligb on 16/9/5.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#ifndef AppDefine_h
#define AppDefine_h

#import "UIView+Ex.h"
#import "SavaData.h"
#import "UIColor+app.h"
#import "MBProgressHUD+Add.h"



/**
 *  保存用户基本信息文件
 *
 */
//用户ID key
#define USER_ID_KEY        @"OWNUSERIDKEY"

//用户token
#define TOKEN_KEY       @"TOKENKEY"

//获取用户UID
#define USERID           [[SavaData shareInstance] usidString]

//获取用户token
#define TOKEN            [[SavaData shareInstance] tokenString]

//用户基本信息保存plist文件
#define User_File        [NSString stringWithFormat:@"user_%@.plist",USERID]

//判断首次打开应用是否走完引导页key  1：走完并进入登陆页 ，0：未走完未进入登陆页 ， 2：已登录并进入首页
#define isFinishGuide    [[SavaData shareInstance] printDataInteger:@"finishGuide"]



#endif /* AppDefine_h */
