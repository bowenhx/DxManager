//
//  FMVideoModel.h
//  DxManager
//
//  Created by ligb on 16/11/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMVideoModel : NSObject

@property (nonatomic , copy) NSString *add_time;

//@property (nonatomic , copy) NSString *add_time;
//
//@property (nonatomic , copy) NSString *add_time;
//
//@property (nonatomic , copy) NSString *add_time;
//
//@property (nonatomic , copy) NSString *add_time;

@property (nonatomic , copy) NSArray *fields;

@property (nonatomic , copy) NSArray *comment;

@property (nonatomic , assign) NSInteger ID;
@property (nonatomic , assign) NSInteger channel_id;
@property (nonatomic , assign) NSInteger category_id;

@end

@interface AttachModel : NSObject

@property (nonatomic , copy) NSString *add_time;

@property (nonatomic , copy) NSString *file_name;

@property (nonatomic , copy) NSString *file_path;

@property (nonatomic , copy) NSString *file_ext;

@property (nonatomic , assign) NSInteger ID;
@property (nonatomic , assign) NSInteger article_id;
@property (nonatomic , assign) NSInteger down_num;
@property (nonatomic , assign) NSInteger file_size;
@end

