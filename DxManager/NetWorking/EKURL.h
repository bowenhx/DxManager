//
//  EKURL.h
//  EduKingdom
//
//  Created by ligb on 16/7/1.
//  Copyright © 2016年 com.mobile-kingdom.ekapps. All rights reserved.
//

#ifndef EKURL_h
#define EKURL_h
#import "EKNotification.h"


#endif /* EKURL_h */
//所有的 url 宏

// API host url
#define BASE_URL @"http://bapi.edu-kingdom.com/index.php"
//关于我们
#define EAPI_About @"http://iphone2.baby-kingdom.com/about.php"
//下載地址
#define EAPI_Download @"http://www.baby-kingdom.com/BAPI/download_app.php"

//下載地址
#define EAPI_Download @"http://www.baby-kingdom.com/BAPI/download_app.php"




///  **** url 统一命名格式为:  EAPI_页面_功能

#pragma mark ----------- 登录
//用户登录api
#define EAPI_Login_Login @"?mod=member&op=login"
//使用facebook 登录
#define EAPI_Login_FBLogin @"?mod=member&op=fblogin"
//注册
#define EAPI_Register  @"?mod=member&op=register"
//用户推出登录api
#define EAPI_Login_LoginOut @"?mod=member&op=logout"
//找回密码
#define EAPI_Login_LostPassword  @"?mod=member&op=lostpwd"


#pragma mark ----------- 首页
//首页列表精选
#define EAPI_Home_List  @"?mod=stand&op=list"
//首页四个icon
#define EAPI_Home_Icon  @"?mod=stand&op=eduicon"
//首页表头显示的推荐数据
#define EAPI_Home_Recommend  @"?mod=stand&op=index"

//搜索论坛和用户
#define EAPI_Search_ForumOrUSer @"?mod=search&op=index"

//获取搜索框关键词
#define EAPI_Search_Key  @"?mod=stand&op=searchkeyword"




#pragma mark ----------- 课程搜索
//课程搜索模块，搜索结果
#define EAPI_CourseSerch_ResoultList  @"?mod=stand&op=search"
//课程搜索模块，最新课程
#define EAPI_CourseSerch_NewCourseList  @"?mod=stand&op=newest"
//课程搜索模块，课程目录
#define EAPI_CourseSerch_DirectoryList  @"?mod=stand&op=catalog"
//课程搜索模块，课程搜索页面，获取三个下拉列表选项值 ：其中 category对象为课程目录列表 district对象为看课程区域列表 fee对象为课程限额列表
#define EAPI_CourseSerch_OptionList  @"?mod=stand&op=seaops"

//补习台
#define EAPI_Tutorial_List  @"?mod=stand&op=tutor"


#pragma mark ----------- 我的
//用户资料
#define EAPI_User_Profile  @"?mod=home&op=profile"
//用户头像上传
#define EAPI_User_Avatar  @"?mod=home&op=avatar"
//我的主题
#define EAPI_User_Topic  @"?mod=home&op=thread"
//我的回复
#define EAPI_User_Reply  @"?mod=home&op=reply"
//我的收藏
#define EAPI_User_Collect  @"?mod=home&op=favorite"
//添加收藏
#define EAPI_User_Favadd @"?mod=home&op=favadd"
//取消收藏
#define BAPI_User_Favdelete @"?mod=home&op=favdelete"


#pragma mark ----------- 好友
//好友列表
#define EAPI_Friend_List     @"?mod=home&op=friend"
//添加或同意好友添加
#define EAPI_Friend_Add      @"?mod=home&op=friendadd"
//刪除或忽略好友
#define EAPI_Friend_Delete      @"?mod=home&op=frienddelete"
//打招呼相關操作
#define EAPI_Greeting    @"?mod=home&op=poke"
//相册
#define EAPI_PhotoGallery @"?mod=home&op=album"


#pragma mark ----------- 举报管理
//举报
#define EAPI_Admin_Report  @"?mod=admin&op=report"
//删除举报
#define EAPI_Admin_DelReport  @"?mod=admin&op=reportdel"
//处理舉報
#define EAPI_Admin_Resolve  @"?mod=admin&op=resolve"


#pragma mark ///////////////举报
//举报
#define BAPI_Report  @"?mod=misc&op=report"

//表情
#define BAPI_Smiley  @"?mod=misc&op=smiley"

//舉報理由
#define BAPI_Reportcustom  @"?mod=misc&op=reportcustom"


#pragma mark //////////////管理
//主題常規管理
#define BAPI_ThreadManager @"?mod=forum&op=moderate"

//屏蔽/解除屏蔽
#define BAPI_PostShield @"?mod=forum&op=modban"

//警告/解除警告
#define BAPI_PostWarning @"?mod=forum&op=modwarn"

//禁言/解除禁言 禁訪問/解除禁止訪問
#define BAPI_MemberBan @"?mod=forum&op=memban"





#pragma mark ----------- 学校
//学校情报区域列表
#define EAPI_School_List  @"?mod=stand&op=schareas"
//获取某区域学校版块列表
#define EAPI_School_Area  @"?mod=stand&op=school"


#pragma mark ----------- 论坛

//版块列表
#define EAPI_Forum_List  @"?mod=forum&op=index"

//精简版块列表
#define EAPI_Forum_Simple  @"mod=forum&op=simplelist"

//主题列表
#define EAPI_Motif_List  @"?mod=forum&op=forumdisplay"


//主题详情
#define EAPI_Motif_Detail @"?mod=forum&op=viewthread"

//板块列表
#define BAPI_BoardList @"?mod=forum&op=index"


//主题详情
#define BAPI_MotifThread @"?mod=forum&op=viewthread"

//发布主题
#define BAPI_IssueThread @"?mod=forum&op=newthread"

//发布帖子（ 跟帖 / 回复 / 引用 ）
#define BAPI_IssueReply @"?mod=forum&op=newreply"

//点评帖子
#define BAPI_Comment @"?mod=forum&op=comment"

//楼层定位
#define BAPI_ForumRedirect  @"?mod=forum&op=redirect"

//点评列表
#define BAPI_CommentList  @"?mod=forum&op=comments"

//点评帖子
#define BAPI_SendComment  @"?mod=forum&op=comment"

//精简版块列表
#define BAPI_ForumSimple  @"?mod=forum&op=simplelist"

//编辑帖子
#define BAPI_Editpost  @"?mod=forum&op=editpost"

//活动贴 报名/取消报名
#define BAPI_ThreadAcitvity   @"?mod=forum&op=activityapplies"

//投票贴 进行投票
#define BAPI_ThreadPoll   @"?mod=forum&op=votepoll"


/**
 *  收藏
 */
//收藏列表
#define BAPI_Favorite @"?mod=home&op=favorite"

//添加收藏
#define BAPI_Favadd @"?mod=home&op=favadd"

//取消收藏
#define BAPI_Favdelete @"?mod=home&op=favdelete"



#pragma mark ----------- 讯息

//消息列表
#define BAPI_PMList @"?mod=home&op=pms"

//消息详细列表
#define BAPI_PMDetail @"?mod=home&op=pmview"

//发送消息
#define BAPI_PMSend @"?mod=home&op=sendpm"

//删除消息
#define BAPI_PMDelete @"?mod=home&op=delpm"

//提醒列表
#define BAPI_NoticeList @"?mod=home&op=notice"

//未读消息数
#define BAPI_BadgeCount @"?mod=home&op=msgcount"




#pragma mark  //// 错误日志
#define BAPI_ErrorLog  @"?mod=misc&op=log"



#pragma mark ----------- 广告

#define BAPI_About @"http://iphone2.baby-kingdom.com/about.php"

#define BAPI_Download @"http://www.baby-kingdom.com/BAPI/download_app.php"

//網站地址
#define BASE_WEB_URL @"http://www.baby-kingdom.com"

//itunes APP ID
#define kITUNES_APP_ID @"1017192240"

//广告地址
#define BAD_Url @"http://iphone2.baby-kingdom.com/extend/ads/bk_mobile_ad.php"

#define kAPP_UrlSchemes @"bk2015://"

#define BAD_SearchUrl @"http://iphone2.baby-kingdom.com/ad/webview.php"

#define VPON_BannerAD_iPhone @"8a8081825161159b0151a89b91314339"

#define VPON_BannerAD_iPad  @"8a8081825161159b0151a89e8072433d"

#define VPON_Config @"http://iphone2.baby-kingdom.com/ad/vpon_config.php?"

#define umeng_key @"57982e1de0f55a229c002b4f"

