//
//  BRuntimeObj.m
//  BKMobile
//
//  Created by Guibin on 15/5/27.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//

#import "BRuntimeObj.h"
#import <objc/runtime.h>

@implementation BRuntimeObj
static char tempObjKey;

+ (void)tempSaveObj:(id)obj{
    objc_setAssociatedObject(self, &tempObjKey,
                             obj,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (id)getTempObj{
    return objc_getAssociatedObject(self, &tempObjKey);
}
@end
