//
//  AppDefine.h
//  DxManager
//
//  Created by ligb on 16/9/5.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#ifndef AppDefine_h
#define AppDefine_h

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





#endif /* AppDefine_h */
